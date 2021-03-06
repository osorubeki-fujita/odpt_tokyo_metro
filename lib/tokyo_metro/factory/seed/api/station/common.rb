module TokyoMetro::Factory::Seed::Api::Station::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 3 )
    @operator_infos , @railway_lines , @station_facility_infos = args
  end

  def optional_variables
    [ @operator_infos , @railway_lines , @station_facility_infos ]
  end

end
