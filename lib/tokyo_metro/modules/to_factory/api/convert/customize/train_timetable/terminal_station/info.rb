module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::TerminalStation::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::TerminalStation::Info.process( self )
  end

end
