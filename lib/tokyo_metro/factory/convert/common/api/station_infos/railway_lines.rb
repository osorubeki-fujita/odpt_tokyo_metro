class TokyoMetro::Factory::Convert::Common::Api::StationInfos::RailwayLines

  def initialize( info , list, replacing_dictionary , ignored_dictionary )
    @info = info
    @list = list
    @replacing_dictionary = replacing_dictionary
    @ignored_dictionary = ignored_dictionary
  end

  def process
    if to_process?
      replacing_railway_lines.each do | replacing_railway_line_name |
        @list << railway_line_info_after_conversion( replacing_railway_line_name )
      end
    else
      unless to_ignore?
        @list << @info
      end
    end
  end

  def self.process( *args )
    self.new( *args ).process
  end

  private

  def replaced_railway_lines
    [ @replacing_dictionary[ station_name ][ "replaced_railway_lines" ] ].flatten
  end

  def replacing_railway_lines
    [ @replacing_dictionary[ station_name ][ "replacing_railway_lines" ] ].flatten
  end

  def to_process?
    @replacing_dictionary.present? and @replacing_dictionary[ station_name ].present? and replaced_railway_lines.include?( @info.railway_line )
  end

  def to_ignore?
    @ignored_dictionary.present? and @ignored_dictionary.find { | item | item[ "stations" ].include?( same_as ) and item[ "stations" ][ "railway_lines" ].include?( @info.railway_line ) }.present?
  end

end