class TokyoMetro::Required::All::Rake::Rails < TokyoMetro::Required

  def self.other_files
    Deploy.files
  end

end