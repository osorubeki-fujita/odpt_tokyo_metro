# 各列車のロケーション情報を格納する配列
class TokyoMetro::Api::TrainLocation::List < TokyoMetro::Api::MetaClass::RealTime::List

  include ::TokyoMetro::ClassNameLibrary::Api::TrainLocation

  def update!( http_client , railway_line , time: ::TokyoMetro.time_now )
    super( http_client , railway_line , time: time )
  end

  def max_delay
    delays = self.map( &:delay )
    if delays.all?( &:blank? )
      nil
    elsif delays.all?( &:present? )
      delays.max
    else
      raise "Error"
    end
  end

  def decorate( request , railway_line )
    ::TokyoMetro::Factory::Decorate::Api::TrainLocation::List.new( request , self , railway_line )
  end

  def exclude_toei_mita_line
    self.class.new( self.select { | train_location_info |
      train_location_info.railway_line  != "odpt.Railway:Toei.Mita"
    } )
  end

  def group_by_railway_direction_in_decorator( railway_line_in_db )
    self.group_by { | item | item.railway_direction_for_grouping_in_decorator( railway_line_in_db ) }
  end

end
