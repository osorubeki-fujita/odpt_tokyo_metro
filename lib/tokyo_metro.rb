require_relative "tokyo_metro/version.rb"

require "active_support"
require "active_support/core_ext"
require "active_support/concern"

require "positive_support"
require "positive_web_support"
require "required_files"

require "odpt_common"
require "odpt_tokyo_metro_helper"

# Encoding.default_external
# require 'psych'

require 'date' # 時刻ライブラリ
require 'yaml'
require 'singleton'
require 'fileutils'

# 東京メトロ オープンデータを扱うモジュール
module TokyoMetro

  LIB_DIR = ::File.expand_path( ::File.dirname( __FILE__ ) )

  # Gem のトップディレクトリ
  # @note "#{ ::Rails.root }" とはしない
  TOP_DIR = ::File.expand_path( "#{ LIB_DIR }/.." )

  # 辞書ファイルのディレクトリ
  DICTIONARY_DIR = ::File.expand_path( "#{ LIB_DIR }/tokyo_metro/dictionary" )

  # @!group API へのアクセス

  # 東京メトロオープンデータ API のエンドポイント
  API_ENDPOINT = "https://api.tokyometroapp.jp/api/v2"

  # データ取得・検索 API
  DATAPOINTS_URL = "#{API_ENDPOINT}/datapoints"

  # 地物情報取得・検索 API
  PLACES_URL = "#{API_ENDPOINT}/places"

  # @!group 駅名辞書

  STATION_DICTIONARY = ::YAML.load_file( "#{ DICTIONARY_DIR }/station/tokyo_metro.yaml" )

  def self.reload_all_files!
    open( "#{ TOP_DIR }/required_files.txt" , "r:utf-8" ).read.split( /\n/ ).each do |f|
      load "#{ ::Rails.root }/#{ f }"
    end
  end

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

  # 現在時刻
  # @note タイムゾーンは日本時間 (GMT+9)
  # @return [DateTime]
  def self.time_now( time_zone: "+09:00" )
    rational_for_time_zone = ::Kernel.Rational(9,24)
    ::DateTime.now.new_offset( rational_for_time_zone )
  end

  # @!group モジュールの組み込み

  def self.set_modules
    # TokyoMetro::Modules::Common::ConvertConstantToClassMethod の TokyoMetro への include は、
    # tokyo_metro/modules/common/convert_constant_to_class_method.rb で行う。

    module_library.each do | module_type , categories |
      categories.each do | category , namespaces |
        [ namespaces ].flatten.each do | namespace |
          eval <<-SET
            ::TokyoMetro::Modules::Api::Convert::#{module_type}::#{category}::#{namespace}.set_modules
          SET
        end
      end
    end

    return nil
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

  def self.require_files( settings: nil , file_type: "txt" )
    raise "Error" unless settings.nil? or ( [ "from_txt" , "update" , "development" , "production" , "test" ].include?( settings.to_s ) )
    required_files( settings , file_type ).each do | filename |
      require filename
    end
  end

  def self.initialize_in_local_environment( rails_dir )
    set_rails_consts( rails_dir )
    set_modules
    set_fundamental_constants
  end

  # @!group Rails 関連

  def self.set_rails_consts( rails_dir = ::Rails.root )
    # Directory of Rails application
    const_set( :RAILS_DIR , rails_dir ) # "C:/RubyPj/rails/tokyo_metro"

    # 開発のためのファイルを格納するディレクトリ
    const_set( :DEV_DIR , "#{ RAILS_DIR }/dev" ) # "C:/RubyPj/rails/tokyo_metro_dev"

  # データベースのディレクトリ
    const_set( :DEV_DB_DIR , "#{ RAILS_DIR }/dev/db" ) # "C:/RubyPj/rails/tokyo_metro_db"

    # fixture ファイルを格納するディレクトリ
    const_set( :RAILS_FIXTURES_DIR , "#{ RAILS_DIR }/test/fixtures" )

    # HTML のディレクトリ
    const_set( :HTML_DIR , "#{ DEV_DIR }/app/html" )

    # HAML のディレクトリ
    const_set( :HAML_DIR , "#{ DEV_DIR }/app/haml" )

    # CSS のディレクトリ
    const_set( :CSS_DIR , "#{ DEV_DIR }/app/assets/css" )

    # SCSS のディレクトリ
    const_set( :SCSS_DIR , "#{ DEV_DIR }/app/assets/scss" )

    return nil
  end

  # @!group Access Token

  # Access Token
  # @note API アクセス用のアクセストークン【必須】【アプリケーションごとに固有】<acl:consumerKey - acl:ConsumerKey>
  # @note 複数のアプリケーションを作成する場合は、それぞれについて取得すること。
  # @note  【公開禁止】
  # @note ファイル名称を .gitignore に記載すること
  def self.set_access_token
    _access_token = access_token
    if _access_token.present?
      const_set( :ACCESS_TOKEN , _access_token )
    else
      puts "Error: The file \'#{ filename }\' does not exist."
    end
  end

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

    private

    def module_library
      h = ::Hash.new

      #---------------- StationTimetable, TrainTimetable ... Patches と Customize で共通して用いるモジュール

      set_namespaces_to_module_library( h , :Common , :Station ,
        :ConnectingRailwayLine
      )

      set_namespaces_to_module_library( h , :Common , :TrainInfos ,
        :ConvertStation ,
        :ConvertTerminalStation ,
        :ConvertStartingStation
      )

      set_namespaces_to_module_library( h , :Common , :StationTimetable ,
        :ConvertTerminalStations
      )

      #---------------- Patches

      set_namespaces_to_module_library( h , :Patches , :Station ,
        :ConnectingRailwayLine
      )

      set_namespaces_to_module_library( h , :Patches , :StationFacility ,
        :EscalatorDirection ,
        :RailwayDirectionInPlatformTransferInfo ,
        :BarrierFreeFacilityLocatedArea
      )

      set_namespaces_to_module_library( h , :Patches , :TrainInfos ,
        :MusashiKosugiInNambokuLine
      )

      set_namespaces_to_module_library( h , :Patches , :StationTimetable ,
        :MusashiKosugiInNambokuLine ,
        :NakanoSakaueOnMarunouchiBranchLine ,
        :Origin ,
        :FukutoshinLineForWakoshi ,
        :MarunouchiBranchLineForNakanoSakaue
      )

      set_namespaces_to_module_library( h , :Patches , :TrainTimetable ,
        :YurakuchoLine
      )

      #---------------- Customize

      set_namespaces_to_module_library( h , :Customize , :Fare ,
        :ChiyodaBranchLine
      )

      set_namespaces_to_module_library( h , :Customize , :RailwayLine ,
        :ChiyodaBranchLine
      )

      set_namespaces_to_module_library( h , :Customize , :Station ,
        :ChiyodaBranchLine ,
        :StationCodeOfNakanoSakaueOnMarunouchiBranchLine ,
        :ConnectingRailwayLine
      )

      set_namespaces_to_module_library( h , :Customize , :StationFacility ,
        :RailwayLineNameInPlatformTransferInfo ,
        :MarunouchiBranchLine ,
        :ChiyodaBranchLine
      )

      set_namespaces_to_module_library( h , :Customize , :TrainTimetable ,
        :StartingStation ,
        :ReplaceStationName ,
        # :MarunouchiBranchLine ,
        :ChiyodaBranchLine ,
        :ToeiMitaLine ,
        :TrainRelationsOnMarunouchiBranchLine
      )

      set_namespaces_to_module_library( h , :Customize , :StationTimetable ,
        # :MarunouchiBranchLine ,
        :ChiyodaBranchLine ,
        :AdditionalInfos
      )

      set_namespaces_to_module_library( h , :Customize , :TrainInfos ,
        :ConvertStation ,
        :ConvertTerminalStation ,
        :ConvertStartingStation ,
        :MarunouchiBranchLine ,
        :ChiyodaBranchLine ,
        :ToeiMitaLine ,
        :RomanceCar
      )

      h
    end

    def set_namespaces_to_module_library( h , module_type , category , *namespaces )
      if h[ module_type ].nil?
        h[ module_type ] = ::Hash.new
      end
      if h[ module_type ][ category ].nil?
        h[ module_type ][ category ] = ::Array.new
      end
      namespaces.flatten.each do | namespace |
        h[ module_type ][ category ] << namespace
      end
    end

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
      raise "Error" unless [ "from_txt" , "production" , "test" , "staging" , "development" ].include?( settings.to_s )
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

    # API への Access Token を返すメソッド
    # @note Rails の環境によって形態が異なる。
    # @return [String]
    def access_token
      if on_rails_application?
        case ::Rails.env
        when "development" , "test"
          access_token_from_file
        when "production"
          ::ENV[ "TOKYO_METRO_ACCESS_TOKEN" ]
        end
      else
        access_token_from_file
      end
    end

    def access_token_from_file
      filename = "#{ RAILS_DIR }/AccessToken"
      if ::File.exist?( filename )
        open( filename , "r:utf-8" ).read
      else
        nil
      end
    end

    def on_rails_application?
      ::Module.constants.sort.include?( :Rails )
    end

  end

  # @!endgroup

end

#--------

::TokyoMetro.require_files( settings: :development , file_type: :txt )
