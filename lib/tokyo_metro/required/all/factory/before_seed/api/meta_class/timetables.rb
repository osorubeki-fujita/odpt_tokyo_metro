class TokyoMetro::Required::All::Factory::BeforeSeed::Api::MetaClass::Timetables < TokyoMetro::Required

  def self.other_files
    [
      files_starting_with( top_file , "train_type_modules" ) ,
      files_starting_with( top_file , "train_type" ) ,
    ]
  end

end
