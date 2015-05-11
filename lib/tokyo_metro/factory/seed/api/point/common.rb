module TokyoMetro::Factory::Seed::Api::Point::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 1 )
    @station_infos = args.first
  end

  def optional_variables
    [ @station_infos ]
  end

end