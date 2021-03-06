class TokyoMetro::App::Renderer::RealTimeInfos::EachRailwayLine < TokyoMetro::Factory::Decorate::MetaClass

  TRAIN_OPERATION_STATUS_FOR_TEST = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/view/train_operation_status_for_test.yaml" )

  def initialize( request , railway_line , http_client , test_mode )
    super( request )
    @railway_line = railway_line
    get_train_operation_info( http_client , test_mode )
    get_train_location_infos( http_client , test_mode )
    set_max_delay
  end

  attr_reader :railway_line
  attr_reader :train_operation_info
  attr_reader :train_location_infos

  def render_train_operation_info( controller )
    @train_operation_info.decorate( request , @railway_line , @max_delay , controller , no_train? ).render
  end

  def render_train_location_infos
    if @train_location_infos.present?
      @train_location_infos.decorate( request , @railway_line ).render
    end
  end

  def update_train_operation_text_in_db
    if @train_operation_info.instance_of?( ::TokyoMetro::Api::TrainOperation::Info )
      @train_operation_info.update_train_operation_text_in_db
    end
  end

  private

  def get_train_operation_info( http_client , test_mode )
    case test_mode
    when nil
      begin
        train_operation_infos = ::TokyoMetro::Api::TrainOperation.get( http_client , railway_line: @railway_line.same_as , parse_json: true , generate_instance: true )
        if train_operation_infos.length > 1
          raise "Error"
        end
        @train_operation_info = train_operation_infos.first
      rescue ::SocketError
        @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::NetworkError.instance
      rescue ::JSON::ParserError
        @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::JsonParserError.instance
      ensure
        sleep( 0.2 )
      end
    when :network_error
      @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::NetworkError.instance
    when :json_parser_error
      @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::JsonParserError.instance
    else
      raise
    end
  end

  def get_train_location_infos( http_client , test_mode )
    case test_mode
    when nil
      begin
        @train_location_infos = ::TokyoMetro::Api::TrainLocation.get( http_client , @railway_line.same_as , parse_json: true , generate_instance: true )
      rescue ::SocketError
        @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::NetworkError.instance
        @train_location_infos = nil
      rescue ::JSON::ParserError
        @train_operation_info = ::TokyoMetro::Api::TrainOperation::Info::JsonParserError.instance
        @train_location_infos = nil
      ensure
        sleep( 0.2 )
      end
    when :network_error , :json_parser_error
      @train_location_infos = nil
    else
      raise
    end
  end

  def set_max_delay
    @max_delay = @train_location_infos.try( :max_delay )
  end

  def no_train?
    @train_location_infos.blank?
  end

end

__END__

Started GET "/train_location/fukutoshin_line" for 127.0.0.1 at 2015-06-11 07:05:07 +0900
Processing by TrainLocationController#action_for_railway_line_page as HTML
  Parameters: {"railway_line"=>"fukutoshin_line"}
Completed 500 Internal Server Error in 2543ms (ActiveRecord: 0.0ms)

JSON::ParserError - A JSON text must at least contain two octets!:
  json (1.8.3) lib/json/common.rb:155:in `parse'
  tokyo_metro (0.6.2) lib/tokyo_metro/factory/get/api/meta_class/fundamental.rb:103:in `parsed_json'
  tokyo_metro (0.6.2) lib/tokyo_metro/factory/get/api/meta_class/fundamental.rb:81:in `process_response'
  tokyo_metro (0.6.2) lib/tokyo_metro/factory/get/api/meta_class/fundamental.rb:51:in `get_data'
  tokyo_metro (0.6.2) lib/tokyo_metro/factory/get/api/data_search/train_location.rb:64:in `process'
  tokyo_metro (0.6.2) lib/tokyo_metro/api/train_location.rb:38:in `get'
  tokyo_metro (0.6.2) lib/tokyo_metro/app/renderer/real_time_infos/each_railway_line.rb:43:in `get_train_location_infos'
  tokyo_metro (0.6.2) lib/tokyo_metro/app/renderer/real_time_infos/each_railway_line.rb:9:in `initialize'
  tokyo_metro (0.6.2) lib/tokyo_metro/app/renderer/real_time_infos.rb:143:in `block in set_infos_of_each_railway_line'
  tokyo_metro (0.6.2) lib/tokyo_metro/app/renderer/real_time_infos.rb:142:in `set_infos_of_each_railway_line'
  tokyo_metro (0.6.2) lib/tokyo_metro/app/renderer/real_time_infos.rb:9:in `initialize'
  app/controllers/concerns/real_time_info_processor.rb:6:in `set_real_time_info_processor'
  app/controllers/train_location_controller.rb:21:in `block in action_for_railway_line_page'
  app/controllers/concerns/action_base_for_railway_line_page.rb:7:in `action_base_for_railway_line_page'
  app/controllers/train_location_controller.rb:19:in `action_for_railway_line_page'

#--------

SocketError - getaddrinfo: ���̂悤�ȃz�X�g�͕s���ł��B  (https://api.tokyometroapp.jp:443):
  httpclient (2.6.0.1) lib/httpclient/session.rb:799:in `create_socket'
  httpclient (2.6.0.1) lib/httpclient/session.rb:747:in `block in connect'
  C:/Ruby21/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout'
  C:/Ruby21/lib/ruby/2.1.0/timeout.rb:101:in `timeout'
  C:/Ruby21/lib/ruby/2.1.0/timeout.rb:127:in `timeout'
  httpclient (2.6.0.1) lib/httpclient/session.rb:746:in `connect'
  httpclient (2.6.0.1) lib/httpclient/session.rb:612:in `query'
  httpclient (2.6.0.1) lib/httpclient/session.rb:164:in `query'
  httpclient (2.6.0.1) lib/httpclient.rb:1191:in `do_get_block'
  httpclient (2.6.0.1) lib/httpclient.rb:974:in `block in do_request'
  httpclient (2.6.0.1) lib/httpclient.rb:1082:in `protect_keep_alive_disconnected'
  httpclient (2.6.0.1) lib/httpclient.rb:969:in `do_request'
  httpclient (2.6.0.1) lib/httpclient.rb:822:in `request'
  httpclient (2.6.0.1) lib/httpclient.rb:713:in `get'
  tokyo_metro (0.6.3) lib/tokyo_metro/factory/get/api/meta_class/fundamental.rb:71:in `response_from_api'
  tokyo_metro (0.6.3) lib/tokyo_metro/factory/get/api/meta_class/fundamental.rb:44:in `get_data'
  tokyo_metro (0.6.3) lib/tokyo_metro/factory/get/api/data_search/train_operation.rb:44:in `process'
  tokyo_metro (0.6.3) lib/tokyo_metro/api/train_operation.rb:28:in `get'
  tokyo_metro (0.6.3) lib/tokyo_metro/app/renderer/real_time_infos/each_railway_line.rb:29:in `get_train_operation_info'
  tokyo_metro (0.6.3) lib/tokyo_metro/app/renderer/real_time_infos/each_railway_line.rb:8:in `initialize'
  tokyo_metro (0.6.3) lib/tokyo_metro/app/renderer/real_time_infos.rb:143:in `block in set_infos_of_each_railway_line'
  C:0:in `map'
  tokyo_metro (0.6.3) lib/tokyo_metro/app/renderer/real_time_infos.rb:142:in `set_infos_of_each_railway_line'
  tokyo_metro (0.6.3) lib/tokyo_metro/app/renderer/real_time_infos.rb:9:in `initialize'
  app/controllers/concerns/real_time_info_processor.rb:7:in `set_real_time_info_processor'
  app/controllers/station_facility_controller.rb:30:in `block in action_for_station_page'
  app/controllers/concerns/action_base_for_station_page.rb:8:in `action_base_for_station_page'
  app/controllers/station_facility_controller.rb:24:in `action_for_station_page'
  actionpack (4.2.1) lib/action_controller/metal/implicit_render.rb:4:in `send_action'
