class TokyoMetro::Factory::Convert::Patch::Api::Station::ConnectingRailwayLine::Info < TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info

  include ::TokyoMetro::Modules::Fundamental::ConvertConstantToClassMethod

  IGNORED_RAILWAY_LINES = ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/additional_infos/patches/station/connecting_railway_line/ignored_railway_lines.yaml" )

  def initialize( object )
    super( object ,  nil , IGNORED_RAILWAY_LINES )
  end

end
