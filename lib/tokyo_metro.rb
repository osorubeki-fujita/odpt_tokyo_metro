require_relative "tokyo_metro/version.rb"

require "active_support"
require "active_support/core_ext"
require "active_support/concern"

require "positive_support"
require "positive_web_support"
require "required_files"
require "odpt_common"

# Encoding.default_external
# require 'psych'

require 'date' # 時刻ライブラリ
require 'yaml'
require 'singleton'
require 'fileutils'

# 東京メトロ オープンデータを扱うモジュール
module TokyoMetro

  LIB_DIR = ::File.expand_path( ::File.dirname( __FILE__ ) )

  # プロジェクトのトップディレクトリ
  # @note "#{ ::Rails.root }" とはしない
  TOP_DIR = ::File.expand_path( "#{ File.dirname( __FILE__ ) }/.." )

  # @!group ディレクトリ

  # 本番環境に移行するファイルを格納するディレクトリ
  PRODUCTION_DIR = TOP_DIR

  # 辞書ファイルのディレクトリ
  DICTIONARY_DIR = ::File.expand_path( "#{ LIB_DIR }/tokyo_metro/dictionary" )

  # 開発のためのファイルを格納するディレクトリ
  DEV_DIR = "C:/RubyPj/rails_tokyo_metro_dev"

  # データベースのディレクトリ
  DB_DIR = "C:/RubyPj/rails_tokyo_metro_db"

  # @!group API へのアクセス

  # Access Token
  # @note API アクセス用のアクセストークン【必須】【アプリケーションごとに固有】<acl:consumerKey - acl:ConsumerKey>
  # @note 複数のアプリケーションを作成する場合は、それぞれについて取得すること。
  # @note  【公開禁止】
  # @note .gitignore に記載すること
  ACCESS_TOKEN = open( "#{ DICTIONARY_DIR }/access_token.txt" , "r:utf-8" ).read

  # 東京メトロオープンデータ API のエンドポイント
  API_ENDPOINT = "https://api.tokyometroapp.jp/api/v2"

  # データ取得・検索 API
  DATAPOINTS_URL = "#{API_ENDPOINT}/datapoints"

  # 地物情報取得・検索 API
  PLACES_URL = "#{API_ENDPOINT}/places"

  # @!group HTML, CSS, HAML, SCSS

  # HTML のディレクトリ
  HTML_DIR = "#{ DEV_DIR }/app/html"

  # HAML のディレクトリ
  HAML_DIR = "#{ DEV_DIR }/app/haml"

  # CSS のディレクトリ
  CSS_DIR = "#{ DEV_DIR }/app/assets/css"

  # SCSS のディレクトリ
  SCSS_DIR = "#{ DEV_DIR }/app/assets/scss"

  # @!group DB

  # Rails の fixture ファイルを格納するディレクトリ
  RAILS_FIXTURES_DIR = "#{ PRODUCTION_DIR }/test/fixtures"

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
  CHANGE_DATE = 3

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

  end

  # @!group 定数

  # 定数の定義
  def self.set_constants( config_of_api_constants = nil )
    set_fundamental_constants
    set_api_constants( config_of_api_constants )
  end

  def self.set_fundamental_constants
    ::TokyoMetro::Static::set_constants
    ::TokyoMetro::Api.set_constants_for_timetable
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
  
  def self.require_files( settings = nil )
    raise "Error" unless settings.nil? or ( [ "from_txt" , "update" , "development" , "production" , "test" ].include?( settings.to_s ) )
    required_files( settings ).each do | filename |
      require filename
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

    def required_files( settings )
      case settings.to_s
      when "from_txt" , "production" , "test"
        open( "#{ ::TokyoMetro::TOP_DIR }/required_files.txt" , "r:utf-8" ).read.split( /\n/ ).map { |f|
          "#{ ::TokyoMetro::TOP_DIR }/#{ f }"
        }

      else
        require_relative "tokyo_metro/required.rb"
        require_relative "tokyo_metro/required/all.rb"

        ::Dir.glob( "#{ ::TokyoMetro::LIB_DIR }/tokyo_metro/required/all/**/**.rb" ).sort.each do | filename |
          require ::File.expand_path( filename )
        end

        ::TokyoMetro::Required::All.files
      end
    end

  end

  # @!endgroup

end

#--------

::TokyoMetro.require_files( :development )