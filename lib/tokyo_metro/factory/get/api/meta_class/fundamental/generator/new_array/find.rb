class TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Find < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Common

  def initialize( ary )
    @ary = ary

    check_validity_of_ary
    check_length_of_ary
    set_namespace
  end

  def self.process( ary )
    if ary.empty?
      return ::Array.new
    else
      self.new( ary ).process
    end
  end

  private

  def check_length_of_ary
    raise unless @ary.length == 1
  end

  def set_namespace
    @namespace = ::TokyoMetro::Api.const_get( namespace_basename )
  end

  def namespace_basename
    _rdf_type_from_api = rdf_type_from_api

    _namespace_basename = namespace_basenames.find { | item | ::TokyoMetro::Api.const_get( item ).rdf_type == _rdf_type_from_api }
    raise unless _namespace_basename.present?
    _namespace_basename
  end

  def rdf_type_from_api
    rdf = @ary.first[ "@type" ]
    raise unless rdf.present?
    rdf
  end

  def namespace_basenames
    [
      :Fare , :PassengerSurvey , :Point ,
      :Station , :StationFacility , :RailwayLine ,
      :StationTimetable , :TrainTimetable ,
      :TrainLocation , :TrainOperation ,
      :MlitRailwayLine , :MlitStation
    ]
  end

end
