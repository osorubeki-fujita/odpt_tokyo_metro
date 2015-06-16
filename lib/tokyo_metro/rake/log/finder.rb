class TokyoMetro::Rake::Log::Finder < LogFinder

  def self.search_by(
    regexp ,
    environment: :development ,
    suffix: nil
    read_length: 256 * 1024 ,
    number_of_lines: nil
  )
    filename = "#{ ::TokyoMetro::TOP_DIR }/log/#{ environment }.log"
    if suffix.present?
      filename += suffix.to_s
    end
    super( regexp , filename , read_length: read_length , number_of_files: number_of_files )
  end

end
