class TokyoMetro::Required::All::Rake::Rails::Deploy::Heroku < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "file_info" )
  end

end