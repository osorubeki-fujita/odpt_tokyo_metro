class TokyoMetro::Required::Static::TrainType < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "required" , "static" , "train_type" )
  end

  def self.other_files
    [ in_api_and_color , custom ]
  end

  class << self

    def in_api_and_color
      [ "in_api" , "color" ].map { | namespace |
        files_starting_with( top_file , namespace )
      }
    end

    def custom
      [
        File.join( top_file , "custom" ) ,
        [ "other_operator" , "default_setting" , "main" ].map { | namespace |
          files_starting_with( top_file , "custom" , namespace )
        }
      ]
    end

  end

end