class TokyoMetro::Required::All::Factory::Decorate < TokyoMetro::Required

  def self.other_files
    [ all_files_in_the_same_directory , Api.files ]
  end

end
