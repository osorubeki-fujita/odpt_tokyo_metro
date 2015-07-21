class TokyoMetro::Rake::Make::YamlStationList::File

  # 駅名の CSV ファイルを処理し、YAML ファイルに変換するメソッド
  # @return [nil]
  def self.process( filename )
    self.new( filename ).process
  end

  def initialize( filename )
    @filename = filename
    set_contents_of_file
  end

  def process
    str = string_for_new_yaml_file
    ::File.open( new_yaml_filename , "w:utf-8" ) do |f|
      f.print( str )
    end
  end

  private

  def set_contents_of_file
    title_of_table_and_header , *rows = ::File.open( file , "r:Windows-31j" ).read.encode( "UTF-8" ).split( /\n/ ).map { | row | row.split( "\," ) }

    title_of_table , *header = title_of_table_and_header
    @title_of_table = title_of_table
    @header = header
    @rows = rows
  end

  def new_yaml_filename
    @filename.gsub( "#{ ::TokyoMetro::GEM_DB_DIR }/dictionary" , ::TokyoMetro.dictionary_dir ).gsub( /\.csv\Z/ , ".yaml" )
  end

  def string_for_new_yaml_file
    str_ary = ::Array.new
    @rows.each do | row |
      str_ary << ::TokyoMetro::Rake::Make::YamlStationList::File::EachStation.yaml_string_of( @header , row )
    end
    str_ary.join( "\n" * 2 )
  end

end
