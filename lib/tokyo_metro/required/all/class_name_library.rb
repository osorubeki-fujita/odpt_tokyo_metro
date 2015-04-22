class TokyoMetro::Required::All::ClassNameLibrary < TokyoMetro::Required

  # class_name_library / クラス名のライブラリ
  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "class_name_library" )
  end

  def self.other_files
    Api.files
  end

end