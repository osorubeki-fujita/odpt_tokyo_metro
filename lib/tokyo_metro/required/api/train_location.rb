class TokyoMetro::Required::Api::TrainLocation < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "api" , "train_location" )
  end

end