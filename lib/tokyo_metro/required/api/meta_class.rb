class TokyoMetro::Required::Api::MetaClass < RequiredFiles::MetaClass

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "meta_class" )
  end

  def self.other_files
    namespaces.map { | namespace |
      files_starting_with( top_file , namespace )
    }
  end

  class << self

    private

    def namespaces
      [ "fundamental" , "data_search" , "not_real_time" , "real_time" , "geo" , "hybrid" ]
    end

  end

end