class TokyoMetro::Required::All::Rake::Make < TokyoMetro::Required

  def self.other_files
    YamlStationList.files
  end

end
