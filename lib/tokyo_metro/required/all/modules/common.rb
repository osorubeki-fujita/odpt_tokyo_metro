class TokyoMetro::Required::All::Modules::Common < TokyoMetro::Required

  def self.other_files
    [
      ::File.join( "#{ top_file }/convert_constant_to_class_method" ) ,
      Info.files
    ]
  end

end
