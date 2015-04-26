class TokyoMetro::Rake::Rails::Deploy::Heroku::FileInfo

  def initialize( filename )
    @filename = filename
    @rows = ::File.open( @filename , "r:utf-8" ).read.split( /\n/ )
  end

end