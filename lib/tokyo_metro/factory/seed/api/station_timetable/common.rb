module TokyoMetro::Factory::Seed::Api::StationTimetable::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 4 )
    @operator_infos , @railway_lines , @stations , @railway_directions = args
  end

  def optional_variables
    [ @operator_infos , @railway_lines , @stations , @railway_directions ]
  end

end