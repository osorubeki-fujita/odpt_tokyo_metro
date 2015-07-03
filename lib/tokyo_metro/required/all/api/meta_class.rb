class TokyoMetro::Required::All::Api::MetaClass < TokyoMetro::Required

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
