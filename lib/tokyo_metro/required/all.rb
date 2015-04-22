class TokyoMetro::Required::All < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
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
      ExtendBuiltinLibraries.files
    ]
  end
  
  def self.ignored_files
    top_file
  end

  def self.files
    _files = super()

    display_files_not_be_required
    output_required_files

    return _files
  end

  class << self

    private

    def display_files_not_be_required
      string_for_regexp_that_ignore_files_under_the_directory_of_this_file = ::File.expand_path( __FILE__ ).gsub( /\/all\.rb\Z/ , "" ).convert_meta_character_in_regexp
      
      # puts string_for_regexp_that_ignore_files_under_the_directory_of_this_file.to_s

      _files_not_be_required = files_not_be_required.delete_if { |f|
        /\A#{ string_for_regexp_that_ignore_files_under_the_directory_of_this_file }/ === f
      }

      if _files_not_be_required.present?
        puts "● These files will not be required."
        puts _files_not_be_required.map { | str | str + ".rb" }
        puts ""
      end
    end

    def output_required_files
       _required_files = required_files.map { | str | str.gsub( "#{ ::TokyoMetro::TOP_DIR }/" , "" ) + ".rb" }
      open( "#{ ::TokyoMetro::TOP_DIR }/required_files.txt" , "w:utf-8" ) do |f|
        f.print _required_files.join( "\n" )
      end
    end

  end

end