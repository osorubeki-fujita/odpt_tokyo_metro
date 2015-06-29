class TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::RomanceCar::Info

  def initialize( obj )
    @obj = obj
  end

  def process
    if romance_car_on_chiyoda_line?
      set_train_type
      set_specific_train_name
    end
  end

  def self.process( obj )
    self.new( obj ).process
  end

  private

  def romance_car_on_chiyoda_line?
    @obj.romance_car_on_chiyoda_line?
  end

  def set_train_type
    @obj.instance_variable_set( :@train_type , "odpt.TrainType:TokyoMetro.RomanceCar" )
  end

  def set_specific_train_name
    _specific_train_name = specific_train_name
    if _specific_train_name.present?
      @obj.instance_variable_set( :@train_name , _specific_train_name )
    end
  end

  def specific_train_name
    ::TokyoMetro::Modules::Common::Dictionary::RomanceCar.train_names[ @obj.same_as ]
  end

end
