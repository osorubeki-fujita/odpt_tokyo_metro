class TokyoMetro::Rake::Rails::Assets::Sass::Make::Partial

  def self.process( on: nil )
    raise unless on.present?
    rails_dir = on
    self.new( rails_dir ).process
  end

  def initialize( rails_dir )
    @erb_dir = "#{ rails_dir }/lib/assets/sass-partial-erbs"
    @style_sheet_dir = "#{ rails_dir }/app/assets/stylesheets"

    @erb_files = ::Dir.glob( "#{ @erb_dir }/**/**.scss.erb" )
  end

  def process
    puts @erb_files

    @erb_files.each do | erb_filepath |
      ::TokyoMetro::Rake::Rails::Assets::Sass::Make::Partial::File.process( erb_filepath , @erb_dir , @style_sheet_dir )
    end

    return nil
  end

end
