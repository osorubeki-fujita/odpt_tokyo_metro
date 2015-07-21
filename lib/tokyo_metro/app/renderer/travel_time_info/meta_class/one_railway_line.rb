class TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::OneRailwayLine < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_info )
    super( request )
    set_railway_line_info( railway_line_info )
    common_procedures_when_initialize
  end

  include ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::Columns
  include ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::Common

  private

  def set_railway_line_info( railway_line_info )
    @railway_line_info = railway_line_info
  end

  def railway_line_info_base
    @railway_line_info
  end

end
