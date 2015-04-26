class TokyoMetro::Required::All::Rake::Rails::Deploy::Heroku::Csv::Command < TokyoMetro::Required

  def self.other_files
    ::File.join( top_file , "meta_class" )
  end

end