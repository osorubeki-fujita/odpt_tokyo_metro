module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ToeiMitaLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ToeiMitaLine::Info.process( self )
  end

end
