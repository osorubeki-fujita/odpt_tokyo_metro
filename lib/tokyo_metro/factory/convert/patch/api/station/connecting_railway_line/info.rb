class TokyoMetro::Factory::Convert::Patch::Api::Station::ConnectingRailwayLine::Info < TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info

  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  IGNORED_RAILWAY_LINE_INFOS = ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/additional_infos/patches/station/connecting_railway_line/ignored_railway_line_infos.yaml" )

  def initialize( object )
    super( object ,  nil , IGNORED_RAILWAY_LINE_INFOS )
  end

end
