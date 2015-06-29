module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::RomanceCar::Info

  private

  def convert_romance_car_on_chiyoda_line_and_set_specific_train_name
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::RomanceCar::Info.process( self )
  end

end
