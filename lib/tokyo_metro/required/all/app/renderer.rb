class TokyoMetro::Required::All::App::Renderer < TokyoMetro::Required

  def self.other_files
    [
      Concern.files ,
      Document.files ,
      PassengerSurvey.files ,
      SideMenu.files ,
      StationFacility.files ,
      StationLinkList.files ,
      Twitter.files ,
      TravelTimeInfo.files
    ]
  end

end