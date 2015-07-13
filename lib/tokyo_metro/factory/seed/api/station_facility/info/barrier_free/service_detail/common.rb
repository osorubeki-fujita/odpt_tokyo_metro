module TokyoMetro::Factory::Seed::Api::StationFacility::Info::BarrierFree::ServiceDetail::Common

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 1 )
    @barrier_free_facility_info_id = args.first
    raise unless @barrier_free_facility_info_id.integer?
  end

  def optional_variables
    [ @barrier_free_facility_info_id ]
  end

end
