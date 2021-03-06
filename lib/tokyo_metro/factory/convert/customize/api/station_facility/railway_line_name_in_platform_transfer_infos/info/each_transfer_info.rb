class TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos::Info::EachTransferInfo < TokyoMetro::Factory::Convert::Common::Api::MetaClass::StationInfos::RailwayLine

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  def initialize( *args , station_facility_same_as )
    super( *args )
    @station_facility_same_as = station_facility_same_as
  end

  private

  def station_name
    @station_facility_same_as
  end

  def railway_line_info_after_conversion( replacing_railway_line_name )
    self.class.platform_transfer_info_class.new( replacing_railway_line_name , @info.railway_direction , @info.necessary_time )
  end

end
