module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::ChiyodaBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ChiyodaBranchLine::Info.process( self )
  end

end
