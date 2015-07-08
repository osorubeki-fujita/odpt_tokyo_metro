module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::TerminalStation::Info::TrainTime::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::TerminalStation::Info::TrainTime::Info.process( self )
  end

end
