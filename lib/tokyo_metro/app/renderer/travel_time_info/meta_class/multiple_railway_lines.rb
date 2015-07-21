class TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::MultipleRailwayLines < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_infos )
    super( request )
    set_railway_line_infos( railway_line_infos )
    common_procedures_when_initialize
  end

  include ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::Columns
  include ::TokyoMetro::App::Renderer::TravelTimeInfo::MetaClass::Common

  private

  def set_railway_line_infos( railway_line_infos )
    @railway_line_infos = railway_line_infos
  end

  def railway_line_info_base
    @main_railway_line_info
  end

end
