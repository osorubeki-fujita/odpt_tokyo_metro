class TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace::MatchedRow

  def initialize( filename , row_content , row_number , regexp_index )
    @filename = filename
    @row_content = row_content
    @row_number = row_number

    @regexp_index = regexp_index
  end

  attr_reader :filename
  attr_reader :regexp_index

  def filename_length
    @filename.length
  end

  def to_s( filename_length_max )
    [
      [ @filename.ljust( filename_length_max ) , @row_number.to_s.rjust(4) ].join( " " ) ,
      " - " ,
      @row_content.gsub( /\A +/ , "" )
    ].join
  end

  def display( filename_length_max , indent = 0 )
    puts " " * indent + to_s( filename_length_max )
  end

end