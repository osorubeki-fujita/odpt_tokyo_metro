class TokyoMetro::Required::All::Refinement < TokyoMetro::Required

  def self.other_files
    Api.files
  end

end