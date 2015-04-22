class TokyoMetro::Required::Factory::Save::Api < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "save" , "api" )
  end

  def self.other_files
    [
      MetaClass.files ,
      #-------- save_realtime_infos / リアルタイム情報の取得
      ::File.join( top_file , "realtime_infos" )
    ]
  end

end