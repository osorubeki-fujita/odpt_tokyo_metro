module TokyoMetro::Rake

  def self.time_dirname( argv )
    normal_error_msg = "Error: Please set time as an option in the command."

    raise normal_error_msg unless argv.length > 1
    args = argv[1..-1].delete_if { |v| /\A-/ === v }

    error_msg_with_options_inspected = "#{ normal_error_msg} The following options are not valid: #{ args.to_s }"
    raise error_msg_with_options_inspected unless args.present?
    time_args = args.select { |v| /\d{14}/ === v }
    raise error_msg_with_options_inspected unless time_args.present?
    
    return time_args.first
  end

end