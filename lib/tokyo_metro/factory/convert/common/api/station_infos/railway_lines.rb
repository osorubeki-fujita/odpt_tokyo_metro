class TokyoMetro::Factory::Convert::Common::Api::StationInfos::RailwayLines

  def initialize( info , list , replacing_dictionary , ignored_dictionary )
    @info = info
    @list = list
    @replacing_dictionary = replacing_dictionary
    @ignored_dictionary = ignored_dictionary

    @to_process = to_process?
  end

  def process
    if @to_process
      replacing_railway_lines_for_this_instance.each do | replacing_railway_line_name |
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

  def station_name
    raise "Error: This method is not defined yet."
  end

  def replaced_railway_lines
    ary = @replacing_dictionary[ station_name ].map { | item | item[ "replaced_railway_lines" ] }.flatten
    raise unless ary.uniq?
    return ary
  end

  def all_replacing_railway_lines
    @replacing_dictionary[ station_name ].map { | item | item[ "replacing_railway_lines" ] }.flatten
  end

  def replacing_railway_lines_for_this_instance
    @replacing_dictionary[ station_name ].find { | item | item[ "replaced_railway_lines".include?( @info.railway_line ) ]}[ "relpacing_railway_lines" ]
  end

  # 処理の対象か否かを判定するメソッド
  # @return [Boolean]
  def to_process?
    @replacing_dictionary.present? and @replacing_dictionary[ station_name ].present? and replaced_railway_lines.include?( @info.railway_line )
  end

  # 無視の対象か否かを判定するメソッド
  # @return [Boolean]
  def to_ignore?
    @ignored_dictionary.present? and @ignored_dictionary.find { | item | item[ "stations" ].include?( same_as ) and item[ "stations" ][ "railway_lines" ].include?( @info.railway_line ) }.present?
  end

end
