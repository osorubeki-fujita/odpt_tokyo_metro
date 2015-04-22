class TokyoMetro::Required::Others < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" )
  end

  def self.other_files
    #---------------- extension_of_builtin_libraries
    #---------------- search / 検索
    #---------------- scss
    #---------------- test
    #---------------- document

    namespaces.map do | namespace |
      files_starting_with( top_file , namespace )
    end

  end

  class << self

    private

    def namespaces
      [ "extend_builtin_libraries" , "search" , "scss" , "test" , "document" ]
    end

  end

end