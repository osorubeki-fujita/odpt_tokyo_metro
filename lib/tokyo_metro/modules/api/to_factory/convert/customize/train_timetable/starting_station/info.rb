module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::StartingStation::Info

  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::StartingStation::Info.process( self )
  end

end
