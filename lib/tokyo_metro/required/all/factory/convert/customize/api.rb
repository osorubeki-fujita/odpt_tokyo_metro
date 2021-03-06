class TokyoMetro::Required::All::Factory::Convert::Customize::Api < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      Fare.files ,
      RailwayLine.files ,
      Station.files ,
      StationFacility.files ,
      StationTimetable.files ,
      TrainTimetable.files ,
      TrainLocation.files
    ]
  end

end
