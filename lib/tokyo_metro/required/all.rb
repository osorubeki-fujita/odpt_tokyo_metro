class TokyoMetro::Required::All < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      ::File.join( top_file , "dictionary" ) ,
      Modules.files ,
      #
      ClassNameLibrary.files ,
      #
      Others.files ,
      Factory.files ,
      App.files ,
      #
      Static.files ,
      Api.files ,
      ApiDecorator.files ,
      Refinement.files ,
      TempLib.files ,
      Document.files ,
      Test.files , 
      Search.files ,
      Rake.files ,
      
    ]
  end

  def self.ignored_files
    top_file
  end

  def self.files( file_type )
    _files = super()

    display_files_not_be_required
    output_required_files( file_type )

    return _files
  end

  class << self

    private

    # require しないファイルを表示するメソッド
    # @return [nil]
    def display_files_not_be_required
      regexp = regexp_for_ignoring_files_under_the_directory_of_this_file
      _files_not_be_required = files_not_be_required.delete_if { |f| regexp === f }

      if _files_not_be_required.present?
        puts "● These files will not be required."
        puts _files_not_be_required.map { | str | str + ".rb" }
        puts ""
      end

      return nil
    end

    # このファイルが存在するディレクトリとその下位ディレクトリのすべてのファイルを無視するための正規表現
    # @return [Regexp]
    def regexp_for_ignoring_files_under_the_directory_of_this_file
      str_in_regexp = ::File.expand_path( __FILE__ ).gsub( /\/all\.rb\Z/ , "" ).convert_meta_character_in_regexp
      /\A#{ str_in_regexp }/
    end

    # require されるファイルを出力するメソッド
    # @return [nil]
    def output_required_files( file_type )
      if file_type.present?
        ::RequiredFiles::Make.send( file_type , required_files , ::TokyoMetro::TOP_DIR , "required_files" )
      end
      return nil
    end

  end

end