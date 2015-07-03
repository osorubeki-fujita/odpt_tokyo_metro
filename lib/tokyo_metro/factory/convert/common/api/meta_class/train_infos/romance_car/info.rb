class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::RomanceCar::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental

  def process
    if romance_car_on_chiyoda_line?
      puts "TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::RomanceCar::Info\#process"
      set_train_type
      set_specific_train_name
    end
  end

  private

  def romance_car_on_chiyoda_line?
    @object.romance_car_on_chiyoda_line?
  end

  def set_train_type
    @object.instance_variable_set( :@train_type , "odpt.TrainType:TokyoMetro.RomanceCar" )
  end

  def set_specific_train_name
    _specific_train_name = specific_train_name
    if _specific_train_name.present?
      @object.instance_variable_set( :@train_name , _specific_train_name )
    end
  end

  def specific_train_name
    ::TokyoMetro::Modules::Common::Dictionary::RomanceCar.train_names[ @object.same_as ]
  end

end
