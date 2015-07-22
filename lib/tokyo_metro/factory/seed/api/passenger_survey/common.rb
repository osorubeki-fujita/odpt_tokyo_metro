module TokyoMetro::Factory::Seed::Api::PassengerSurvey::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 1 )
    @operator_infos = args.first
  end

  def optional_variables
    [ @operator_infos ]
  end

end