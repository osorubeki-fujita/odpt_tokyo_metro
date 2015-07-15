require_relative "tokyo_metro/version.rb"

require 'httpclient'

require "active_support"
require "active_support/core_ext"
require "active_support/concern"

require "positive_support"
require "positive_web_support"
require "required_files"

require "odpt_common"
require "odpt_tokyo_metro_helper"
require "with_default_value"

require "rails_decorate_factory"
require "log_finder"

# Encoding.default_external
# require 'psych'

require 'date' # 時刻ライブラリ
require 'yaml'
require 'singleton'
require 'fileutils'

require 'holiday_japan'

# 東京メトロ オープンデータを扱うモジュール
module TokyoMetro

  LIB_DIR = ::File.expand_path( ::File.dirname( __FILE__ ) )

  # Gem のトップディレクトリ
  # @note "#{ ::Rails.root }" とはしない
  TOP_DIR = ::File.expand_path( "#{ LIB_DIR }/.." )

  # 辞書ファイルのディレクトリ
  DICTIONARY_DIR = ::File.expand_path( "#{ LIB_DIR }/tokyo_metro/dictionary" )

# データベースのディレクトリ
  const_set( :GEM_DB_DIR , "#{ TOP_DIR }/db" )
  const_set( :API_LOG_DIR , "#{ GEM_DB_DIR }/api_log" )
  const_set( :API_LOG_DEFAULT_DIR , "#{ API_LOG_DIR }/201412" )

  # @!group API へのアクセス

  # 東京メトロオープンデータ API のエンドポイント
  API_ENDPOINT = "https://api.tokyometroapp.jp/api/v2"

  # データ取得・検索 API
  DATAPOINTS_URL = "#{API_ENDPOINT}/datapoints"

  # 地物情報取得・検索 API
  PLACES_URL = "#{API_ENDPOINT}/places"

  # @!group 駅名辞書

  STATION_DICTIONARY = ::YAML.load_file( "#{ DICTIONARY_DIR }/station/tokyo_metro.yaml" )

  def self.station_dictionary_including_main_info( stations_of_railway_lines = nil )
    if stations_of_railway_lines.nil?
      stations_of_railway_lines = ::Station::Info.where( operator_id: ::Operator.id_of_tokyo_metro )
    end

    h = ::Hash.new

    station_dictionary.each do | name_in_system , name_ja |
      stations_in_db = stations_of_railway_lines.where( name_in_system: name_in_system )
      name_h = {
        :name_ja => stations_in_db.first.name_ja ,
        :name_hira => stations_in_db.first.name_hira ,
        :name_en => stations_in_db.first.name_en ,
        :name_in_system => name_in_system ,
        :station_codes => stations_in_db.pluck( :station_code )
      }
      h[ name_in_system ] = name_h
    end

    return h
  end

  # @!group 時刻

  # ダイヤ上の日付変更時刻
  DATE_CHANGING_HOUR = 3

  DEFAULT_TIME_ZONE = ::Kernel.Rational(9,24)

  # 現在時刻
  # @note タイムゾーンは日本時間 (GMT+9)
  # @return [DateTime]
  def self.time_now( time_zone: nil )
    rational_for_time_zone ||= DEFAULT_TIME_ZONE
    ::DateTime.now.new_offset( rational_for_time_zone )
  end

  # @!group モジュールの組み込み

  def self.set_modules
    ::TokyoMetro::Initializer::Modules.set
  end

  # @!group 定数

  # 定数の定義

  def self.set_fundamental_constants
    ::TokyoMetro::Static::set_constants
    ::TokyoMetro::Api.set_constants_for_timetable
  end

  def self.set_constants( config_of_api_constants = nil )
    set_fundamental_constants
    set_api_constants( config_of_api_constants )
  end

  def self.set_api_constants( config_of_api_constants = nil )
    ::TokyoMetro::Api::set_constants( config_of_api_constants )
  end

  def self.set_all_api_constants
    set_api_constants( config_of_api_constants_when_load_all )
  end

  def self.set_all_api_constants_without_fare
    set_api_constants( config_of_api_constants_when_load_without_fare )
  end

  # @!group 関連ファイルのロード

  def self.reload_all_files!
    open( "#{ TOP_DIR }/required_files.txt" , "r:utf-8" ).read.split( /\n/ ).each do |f|
      load "#{ ::Rails.root }/#{ f }"
    end
  end

  def self.require_files( settings: nil , file_type: "txt" )
    settings ||= :make_list_of_required_files
    required_files( settings , file_type ).each do | filename |
      require filename
    end
  end

  def self.initialize_in_local_environment( rails_dir )
    set_rails_consts( rails_dir )
    set_modules
    set_fundamental_constants

    set_access_token
    set_google_maps_api_key
  end

  # @!group GoogleMaps

  # @see https://developers.google.com/maps/documentation/javascript/tutorial?hl=ja
  def self.google_maps_javasciprt_uri
    "https://maps.googleapis.com/maps/api/js?key=#{ GOOGLE_MAPS_API_KEY }&sensor=true"
  end

  # @!group Rails 関連

  def self.set_rails_consts( rails_dir = ::Rails.root.to_s )
    ::TokyoMetro::Initializer::Rails.consts_in_gem.set( as_for: rails_dir )
  end

  # @!group 運行日に関するメソッド

  def self.current_operation_day
    ::TokyoMetro::Static::OperationDay.of_current
  end

  def self.operation_day_as_of( time )
    ::TokyoMetro::Static::OperationDay.as_of( time )
  end

  # @!group 運行ダイヤに関するメソッド

  def self.diagram_as_of( time )
    t = operation_day_as_of( time )
    ::TokyoMetro::Factory::Db::OperationDay.select_by(t)
  end

  def self.current_diagram
    diagram_as_of( current_operation_day )
  end

  # @!group Class methods
  class << self

    def method_missing( method_name , *args )
      if /const/ === method_name.to_s
        valid_method_name = method_name.to_s.gsub( "const" , "constant" )
        if methods.map( &:to_s ).include?( valid_method_name )
          return send( valid_method_name , *args )
        end
      end

      super( method_name , *args )
    end

    # @!group Access Token , Google Map Api Key

    # @note access_token

    # Access Token
    #   API への Access Token を返すメソッド
    #   @note Rails の環境によって形態が異なる。
    #   @note API アクセス用のアクセストークン【必須】【アプリケーションごとに固有】<acl:consumerKey - acl:ConsumerKey>
    #   @note 複数のアプリケーションを作成する場合は、それぞれについて取得すること。
    #   @note  【公開禁止】
    #   @note ファイル名称を .gitignore に記載すること
    #   @return [String]
    [ :access_token , :google_maps_api_key ].each do | const_name |
      eval <<-DEF

        def set_#{ const_name }
          _#{ const_name } = #{ const_name }
          if _#{ const_name }.present?
            const_set( :#{ const_name.upcase } , _#{ const_name } )
          else
            filename = #{ const_name }_filename
            error_msg = "Error: The file \\"" + filename + "\\" does not exist."
            puts error_msg
          end
        end

        def #{ const_name }
          if on_rails_application?
            case ::Rails.env
            when "development" , "test"
              #{ const_name }_from_file
            when "production"
              ::ENV[ "TOKYO_METRO_#{ const_name.upcase }" ]
            end
          else
            #{ const_name }_from_file
          end
        end

        private :#{ const_name }

        def #{ const_name }_from_file
          filename = #{ const_name }_filename
          # puts filename
          if ::File.exist?( filename )
            open( filename , "r:utf-8" ).read.chomp
          else
            nil
          end
        end

        private :#{ const_name }_from_file

        def #{ const_name }_filename
          # puts "TokyoMetro::RAILS_DIR: " + ::TokyoMetro::RAILS_DIR.to_s + " (" + ::TokyoMetro::RAILS_DIR.class.to_s + ")"
          ::TokyoMetro::RAILS_DIR + "/#{ const_name.camelize }"
        end

        private :#{ const_name }_filename

      DEF

    end

    private

    def config_of_api_constants_when_load_all
      h = ::Hash.new
      api_constant_keys.each do | key |
        h[ key ] = true
      end
      h
    end

    def config_of_api_constants_when_load_without_fare
      h = ::Hash.new
      ( api_constant_keys - [ :fare ] ).each do | key |
        h[ key ] = true
      end
      h
    end

    def api_constant_keys
      [ :station_facility , :passenger_survey , :station , :railway_line , :point , :fare , :station_timetable , :train_timetable ]
    end

    def required_files( settings , file_type )
      raise "Error: settings '#{ settings }' is not valid." unless [ "from_txt" , "make_list_of_required_files" , "update" , "development" , "production" , "test" , "staging"].include?( settings.to_s )
      raise "Error" unless [ "txt" , "yaml" , "json" , "cson" ].include?( file_type.to_s )

      case settings.to_s
      when "from_txt" , "production" , "test"
        ::RequiredFiles::Get.send( "from_#{ file_type }" , ::TokyoMetro::TOP_DIR , "required_files" )

      else
        require_relative "tokyo_metro/required.rb"
        require_relative "tokyo_metro/required/all.rb"

        ::Dir.glob( "#{ ::TokyoMetro::LIB_DIR }/tokyo_metro/required/all/**/**.rb" ).sort.each do | filename |
          require ::File.expand_path( filename )
        end

        ::TokyoMetro::Required::All.files( file_type )
      end
    end

  end

end

def on_rails_application?
  ::Module.constants.include?( :Rails )
end

#--------


::TokyoMetro.require_files( settings: ::ENV[ 'RAILS_ENV' ] , file_type: :txt )
