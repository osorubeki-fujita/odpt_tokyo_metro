module TokyoMetro::Factory::Seed::Api::Fare::Common

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 2 )
    @fare_normal_groups , @operators = args
  end

  def optional_variables
    [ @fare_normal_groups , @operators ]
  end

end
