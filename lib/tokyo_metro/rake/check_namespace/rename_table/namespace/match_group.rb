class TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace::MatchGroup

  def initialize( matched_rows , regexp , filename_length_max )
    @matched_rows = matched_rows
    @regexp = regexp
    @filename_length_max = filename_length_max
  end

  include ::TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace::InfoOfRows

  def display( indent = 0 )
    puts " " * indent + "* " + @regexp.inspect
    puts ""

    @matched_rows.each do | matched_row |
      matched_row.display( @filename_length_max , indent * 2 )
    end

    display_info_of_rows( indent )
  end

end