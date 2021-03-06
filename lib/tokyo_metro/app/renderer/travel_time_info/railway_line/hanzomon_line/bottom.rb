class TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::HanzomonLine::Bottom < TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::ThroughOperation

  def initialize( request , left_columns , columns_next_to_railway_line , right_columns )
    super( request , left_columns , columns_next_to_railway_line , right_columns )
    @position = :bottom
    @class_name = :hanzomon_tobu
    @content = ::TokyoMetro::App::Renderer::TravelTimeInfo::RailwayLine::HanzomonLine::Bottom::ToTobuLine.new( @request )
  end

end