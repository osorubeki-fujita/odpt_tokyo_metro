module TokyoMetro::Rake

  def self.time_dirname( argv )
    raise "Error" unless argv.length > 1
    args = argv[1..-1].delete_if { |v| /\A-/ === v }
    raise "Error" unless args.present?
    time_args = args.select { |v| /\d{14}/ === v }
    raise "Error" unless time_args.present?
    time_args.first
  end

end