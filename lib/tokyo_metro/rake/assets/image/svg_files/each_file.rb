class TokyoMetro::Rake::Assets::Image::SvgFiles::EachFile

  HASH_FOR_CONVERSION = {
    "wheel_chair" => "wheel_chair" ,
    "車" => "wheel_chair" ,
    "乳" => "baby" ,
    "オ" => "ostomate" ,
    "escalator" => "escalator" ,
    "階段" => "stair" ,
    "階段昇降機" => "stairlift" ,
    "エレベーター" => "elevator" ,
    "スロープ" => "slope" ,
    "トイレ" => "toilet" ,
    "乳幼児用設備" => "facility_for_baby" ,
    "オストメイト" => "ostomate" ,
    "コインロッカー" => "locker" ,
    "上" => "up" ,
    "下" => "down" ,
    "上下" => "both" ,
    "改札内" => "inside" ,
    "改札外" => "outside" ,
    "stations" => "stations" ,
    "barrier_free_facilities" => "barrier_free_facilities"
  }

  def initialize( svg_dirname , asset_image_dirname , filename )
    @svg_dirname = svg_dirname
    @asset_image_dirname = asset_image_dirname
    @filename = filename

    @new_file_basename = new_file_basename( filename )
    @new_dir_basename = new_dir_basename( filename )
  end

  def copy
    puts ( new_filename.ljust(128) + " <= " + @filename )
    # ::FileUtils.copy( @filename , new_filename )
  end

  private

  def new_filename
    "#{ @asset_image_dirname }/#{ @new_dir_basename }/#{ @new_file_basename }.svg"
  end

  def new_file_basename( filename )
    file_basename = File.basename( filename , ".*" ).encode( "UTF-8" )
    file_basename_elements = file_basename.gsub( /\A(toilet|wheel_chair|escalator|others|icon)_/ ) { "#{$1}\n" }.split( /[\n（）・／]/ )

    new_file_basename_ary = ::Array.new
    while !( file_basename_elements.empty? )
      element = file_basename_elements.shift
      unless HASH_FOR_CONVERSION[ element ].nil?
        new_file_basename_ary << HASH_FOR_CONVERSION[ element ]
      end
    end
    new_file_basename_ary.select( &:present? ).join( "_" )
  end

  def new_dir_basename( filename )
    if [ "icon_platform_info" , "icon_station" ].include?( filename )
      "customized_icon"
    else
      "barrier_free_facility"
    end
  end

end
