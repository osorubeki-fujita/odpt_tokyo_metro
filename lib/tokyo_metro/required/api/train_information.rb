class TokyoMetro::Required::Api::TrainInformation < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "train_information" )
  end

end