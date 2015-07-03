class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::ToeiMitaLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental

  def process
    if toei_mita_line_train_including_on_namboku_line?
      convert_railway_line
      convert_railway_direction
      convert_train_type
    end
  end

  private

  def toei_mita_line_train_including_on_namboku_line?
    object.toei_mita_line_train_including_on_namboku_line?
  end

  def convert_railway_line
    object.instance_variable_set( :@railway_line , "odpt.Railway:Toei.Mita" )
  end

  def convert_railway_direction
    case object.railway_direction
    when "odpt.RailDirection:TokyoMetro.Meguro"
      railway_direction_new = "odpt.RailDirection:Toei.Meguro"
    when "odpt.RailDirection:TokyoMetro.ShirokaneTakanawa"
      railway_direction_new = "odpt.RailDirection:Toei.NishiTakashimadaira"
    end
    object.instance_variable_set( :@railway_direction , railway_direction_new )
  end

  def convert_train_type
    case object.train_type
    when "odpt.TrainType:TokyoMetro.Local"
      train_type_new = "odpt.TrainType:Toei.Local"
    when "odpt.TrainType:TokyoMetro.Express"
      train_type_new = "odpt.TrainType:Toei.Express"
    end
    object.instance_variable_set( :@train_type , train_type_new )
  end

end
