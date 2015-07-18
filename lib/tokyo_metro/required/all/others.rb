class TokyoMetro::Required::All::Others < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    #-------- extension_of_builtin_libraries
    #-------- search
    #-------- scss
    #-------- test
    #-------- document
    namespaces.map do | namespace |
      files_starting_with( top_file , namespace )
    end

  end

  class << self

    private

    def namespaces
      [ "search" , "test" , "document" ]
    end

  end

end
