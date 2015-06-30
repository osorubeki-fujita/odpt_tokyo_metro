class TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::RomanceCar::Info < TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::RomanceCar::Info

  private

  def set_train_type
    if on_rails_application?
      generate_log_of_romance_car
    end
    super
  end

  def generate_log_of_romance_car
    case ::Rails.env
    when "development" , "test"
      _log_as_for_romance_car = log_as_for_romance_car
      puts _log_as_for_romance_car
      ::Rails.application.config.romance_car_logger.info( _log_as_for_romance_car )
    when "production"
      ::Rails.logger.info( "[Romance Car] #{ log_as_for_romance_car }" )
    end
  end

  def log_as_for_romance_car
    str_ary = ::Array.new
    str_ary << "[Before convert] Time: #{ ::TokyoMetro.time_now.to_s }"
    str_ary << "dc_date: #{ object.dc_date }"
    str_ary << "train_type: #{ object.train_type }"
    # str_ary << "Train name: #{ decorator.train_name }"
    begin
      case object.train_type
      when "odpt.TrainType:TokyoMetro.LimitedExpress"
        str_ary <<  object.inspect
      when "odpt.TrainType:TokyoMetro.RomanceCar"
        str_ary <<  object.inspect
      else
        raise
      end
    # train_type が不正の場合
    rescue
      str_ary <<  object.inspect
    end
    str_ary.join( " / " )
  end

end
