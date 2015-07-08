class TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info::ConnectingRailwayLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::StationInfos::RailwayLine

  include ::TokyoMetro::ClassNameLibrary::Api::Station

  def initialize( *args , station_same_as )
    super( *args )
    @station_same_as = station_same_as
  end

  private

  def station_name
    @station_same_as
  end

  def railway_line_info_after_conversion( replacing_railway_line_name )
    self.class.connecting_railway_line_info_class.new( replacing_railway_line_name )
  end

end
