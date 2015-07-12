module TokyoMetro::Factory::Seed::Api::StationTimetable::Info::Fundamental::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 5 )
    @info_id , @operators , @railway_lines , @stations , @railway_directions = args
  end

  def optional_variables
    [ @info_id , @operators , @railway_lines , @stations , @railway_directions ]
  end

end
