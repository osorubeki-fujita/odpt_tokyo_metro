# 駅名のリストを作成するときの各駅の情報を扱うクラス
class TokyoMetro::Rake::Make::YamlStationList::File::EachStation

  # スラッシュ（前後に空白がある場合はそれも含む）にマッチする正規表現
  REGEXP_FOR_SPLIT = / *\/ */

  def self.yaml_string_of( header , row )
    self.new( header , row ).to_yaml_str
  end

  # Constructor
  def initialize( header , row )
    key_of_h , *contents = row
    @header = header
    @key = key_of_h
    @contents = contents
  end

  def to_yaml_str

  end

  def station_info?
    /\Aodpt\.Station\:/ === @key
  end

  def station_facility_info?
    /\Aodpt\.StationFacility\:/ === @key
  end

  [ :station_facility , :station_facility_custom , :station_facility_custom_alias ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @contents[ @header.index( "#{ method_name }" ) ]
      end
    DEF
  end

  private

  def has_station_code_in_header?
    @header.include?( "station_code" )
  end

  def to_h
    h = ::Hash.new

    h[ "same_as" ] = @key

    _last_index_of_station_info = last_index_of_station_info

    for i in 0..( @contents.length - 1 )
      content = @contents[i]
      title = @header[ i ]
      if i <= _last_index_of_station_info or [ "administrator" , "other_operator" ].include?( title )
        # inspect_of_custom_alias( title , content )
        h[ title ] = set_content( title , content )
      else
        ::TokyoMetro::Rake::Make::YamlStationList::File::EachStation::TrainType.process( h , title , content )
      end
    end

    return h
  end

  # 駅情報の最後の index（この先は停車駅情報）
  def last_index_of_station_info
    if has_station_code_in_header?
      @header.index( "station_code" )
    else
      @header.index( "name_en" )
    end
  end

  def inspect_of_custom_alias( title , content )
    if title == "station_facility_custom" and content == @key
      custom_alias = station_facility_custom_alias
      unless custom_alias.nil? or custom_alias == ""
        puts custom_alias
      end
    end
  end

  # ハッシュ (h2) の値の設定
  def set_content( title , content )
    if content.string? and REGEXP_FOR_SPLIT === content
      return content.split( REGEXP_FOR_SPLIT )

    elsif station_facility_info? and title == "station_facility_custom" and content == @key
      _station_facility_custom_alias = station_facility_custom_alias
      if _station_facility_custom_alias.blank?
        return nil
      end

    elsif station_info? and title == "station_facility_custom" and content == station_facility
      return nil

    elsif /Kojimachi\Z/ === content and title == "name_ja"
      return "麴町"
    end

    return content
  end

end

__END__

  def string_for_new_yaml_file

    hash_of_hash.each do | key , h2 |
      str_ary_for_each_element = ::Array.new
      str_ary_for_each_element << "#{key}\:"
      h2.each do | title , value_of_h2 |
        set_yaml_str_for_each_value( title , value_of_h2 , str_ary_for_each_element )
      end
      str_ary << str_ary_for_each_element.join( "\n" )
    end


  end


    def set_yaml_str_for_each_value( title , value_of_h2 , str_ary_for_each_element )
      unless value_of_h2.nil? or ( value_of_h2.string? and /\A *\Z/ === value_of_h2 )
        if value_of_h2.string?
          str_ary_for_each_element << " " * 2 + "#{title}\: #{ value_of_h2 }"

        elsif value_of_h2.array?
          str_ary_for_each_element << " " * 2 + "#{title}\:"
          value_of_h2.each do | element_of_list |
            str_ary_for_each_element << " " * 4 + "- #{element_of_list}"
          end

        elsif value_of_h2.hash? and value_of_h2.values.all?( &:string? )
          str_ary_for_each_element << " " * 2 + "#{title}\:"
          value_of_h2.each do | key , value |
            str_ary_for_each_element << " " * 4 + "#{title}\: #{value}"
          end

        else
          raise "Error\: #{value.class.name} is not valid."
        end
      end
    end
