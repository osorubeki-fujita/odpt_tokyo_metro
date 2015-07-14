module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::MarunouchiBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::MarunouchiBranchLine::Info.process( self )
  end

end
