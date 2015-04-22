class TokyoMetro::Required::All::Factory::Save::Api < TokyoMetro::Required

  def self.other_files
    [
      MetaClass.files ,
      #-------- save_realtime_infos / リアルタイム情報の取得
      ::File.join( top_file , "realtime_infos" )
    ]
  end

end