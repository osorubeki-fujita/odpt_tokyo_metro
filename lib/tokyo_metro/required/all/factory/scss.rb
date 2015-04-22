class TokyoMetro::Required::All::Factory::Scss < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "factory" , "scss" )
  end

  def self.other_files
    [ "fundamental" , "colors" , "train_type" ].map { | filename |
      ::File.join( top_file , filename )
    } + [ "operators" , "railway_lines" , "train_types" ].map { | namespace |
      [
        ::File.join( top_file , namespace ) ,
        [ "dirname_settings" , "fundamental" , "colors" ].map { | filename |
          ::File.join( top_file , namespace , filename )
        }
      ]
    }
  end

end