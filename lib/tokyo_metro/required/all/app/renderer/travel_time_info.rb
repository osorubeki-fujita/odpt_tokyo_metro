class TokyoMetro::Required::All::App::Renderer::TravelTimeInfo < TokyoMetro::Required

  def self.other_files
    [ MetaClass.files , RailwayLine.files ]
  end

end