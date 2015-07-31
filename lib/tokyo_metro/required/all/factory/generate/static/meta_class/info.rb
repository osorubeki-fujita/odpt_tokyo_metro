class TokyoMetro::Required::All::Factory::Generate::Static::MetaClass::Info < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: true )
  end

  def self.other_files
    [ "fundamental" , "sub_info" , "normal "].map { | filename |
      ::File.join( top_file , filename )
    }
  end

end
