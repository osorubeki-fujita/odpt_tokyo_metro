class TokyoMetro::Required::All::Rake::Rails::Deploy < TokyoMetro::Required

  def self.other_files
    Heroku.files
  end

end