class TokyoMetro::Required::All::Api::TrainInformation < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "train_information" )
  end

end