module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::ToeiMitaLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ToeiMitaLine::Info.process( self )
  end

end
