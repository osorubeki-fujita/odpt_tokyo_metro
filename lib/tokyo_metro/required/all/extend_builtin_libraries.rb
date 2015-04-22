class TokyoMetro::Required::All::ExtendBuiltinLibraries < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "extend_builtin_libraries" )
  end

end