class TokyoMetro::Required::All::Rake < TokyoMetro::Required

  def self.other_files
    [
      Make.files ,
      Rails.files
    ]
  end

end
