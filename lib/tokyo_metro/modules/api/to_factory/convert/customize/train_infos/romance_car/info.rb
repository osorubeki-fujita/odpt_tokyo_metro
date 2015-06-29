module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainInfos::RomanceCar::Info

  def initialize( *variables )
    super( *variables )
    convert_romance_car_on_chiyoda_line_and_set_specific_train_name
  end

  attr_reader :train_name

end
