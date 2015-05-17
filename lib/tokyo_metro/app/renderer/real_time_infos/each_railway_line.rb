class TokyoMetro::App::Renderer::RealTimeInfos::EachRailwayLine < TokyoMetro::Factory::Decorate::MetaClass

  STATUS_LIST_FOR_TEST = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/view/train_information/status_list_for_test.yaml" )

  def initialize( request , railway_line , http_client )
    super( request )
    @railway_line = railway_line
    get_train_operation_info( http_client )
    get_train_location_infos( http_client )
    set_max_delay
  end

  attr_reader :railway_line
  attr_reader :train_operation_info
  attr_reader :train_location_infos

  def render_train_operation_info( controller )
    @train_operation_info.decorate( request , @railway_line , @max_delay , controller , no_train? ).render
  end

  def render_train_location_infos
    @train_location_infos.exclude_toei_mita_line.decorate( request , @railway_line ).render
  end

  private

  def get_train_operation_info( http_client )
    train_operation_infos = ::TokyoMetro::Api::TrainInformation.get(
      http_client ,
      railway_line: @railway_line.same_as ,
      perse_json: true ,
      generate_instance: true
    )
    if train_operation_infos.length > 1
      raise "Error"
    end
    @train_operation_info = train_operation_infos.first
    sleep( 0.2 )
  end

  def get_train_location_infos( http_client )
    @train_location_infos = ::TokyoMetro::Api::TrainLocation.get(
      http_client ,
      @railway_line.same_as ,
      perse_json: true ,
      generate_instance: true
    )
    sleep( 0.2 )
  end

  def set_max_delay
    @max_delay = @train_location_infos.try( :max_delay )
  end

  def no_train?
    @train_location_infos.blank?
  end

end