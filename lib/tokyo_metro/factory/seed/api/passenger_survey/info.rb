class TokyoMetro::Factory::Seed::Api::PassengerSurvey::Info < TokyoMetro::Factory::Seed::Api::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Api::PassengerSurvey
  include ::TokyoMetro::Factory::Seed::Api::PassengerSurvey::Common
  include ::TokyoMetro::Factory::Seed::Reference::Operator

  private

  def hash_to_db
    h = ::Hash.new
    h[ :operator_info_id ] = operator_info_id
    [ :id_urn , :same_as , :survey_year , :passenger_journeys ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end
    h
  end

end
