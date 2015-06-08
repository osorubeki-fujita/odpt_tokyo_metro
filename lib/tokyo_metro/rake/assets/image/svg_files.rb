class TokyoMetro::Rake::Assets::Image::SvgFiles

  def initialize
    @svg_dirname = "#{ ::TokyoMetro::DEV_DIR }/app/images/svg"
    @asset_image_dirname = "#{ ::TokyoMetro::RAILS_DIR }/app/assets/images/barrier_free_facility"
    @svg_files = ::Dir.glob( "#{svg_dirname}/**.svg" )
  end

  def copy
    @svg_files.sort.each do | filename |
      EachFile.new( @svg_dirname , @asset_image_dirname , filename ).copy
    end
  end

  def self.copy
    self.new.copy
  end

end
