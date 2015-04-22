class TokyoMetro::Required::All::Api::StationTrainTime < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_train_time" )
  end

end