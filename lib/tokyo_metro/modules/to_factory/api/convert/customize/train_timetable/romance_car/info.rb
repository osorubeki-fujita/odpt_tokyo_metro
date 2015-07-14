module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::TrainTimetable::RomanceCar::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::RomanceCar::Info.process( self )
  end

  attr_reader :train_name

end
