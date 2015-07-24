class TokyoMetro::Rake::Rails::Assets::Sass::Make::Partial::File < OdptCommon::Factory::MetaProcessor::Process

  def initialize( erb_filepath , erb_dir , style_sheet_dir )
    @erb_filepath = erb_filepath
    @scss_filepath = @erb_filepath.gsub( erb_dir , style_sheet_dir ).gsub( /\.erb\Z/ , "" )
  end

  def process
    mkdir_of_scss_filepath
    make_scss_file
  end

  private

  def erb_instance
    ::ERB.new( ::File.open( @erb_filepath , "r:utf-8" ).read )
  end

  def scss_content
    erb_instance.result.gsub( /^[ \t]+$/ , "" ).gsub( /\n{2,}/ , "\n" ).gsub( /\A\n+/ , "" )
  end

  def mkdir_of_scss_filepath
    ::FileUtils.mkdir_p( ::File.dirname( @scss_filepath ) )
  end

  def make_scss_file
    ::File.open( @scss_filepath , "w:utf-8" ) do |f|
      f.print( scss_content )
    end
  end

end
