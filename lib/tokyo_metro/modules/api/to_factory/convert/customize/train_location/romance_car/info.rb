module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::RomanceCar::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::RomanceCar::Info.process( self )
  end

  attr_reader :train_name

end
