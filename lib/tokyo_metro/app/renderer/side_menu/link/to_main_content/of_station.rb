class TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::OfStation < TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index

  def initialize( request , station_name , title_ja , title_en , url: nil , controller: nil , icon_name: nil , additional_class_name_of_text_domain: nil )
    @station_name = station_name
    super(
      request ,
      title_ja ,
      title_en ,
      url: url ,
      controller: controller ,
      icon_name: icon_name ,
      additional_class_name_of_text_domain: additional_class_name_of_text_domain
    )
  end

  private

  def set_actual_url( url , controller )
    raise "Error" if url.blank? and controller.blank?
    raise "Error" if url.present? and controller.present?
    if controller.present?
      url_helpers.url_for( controller: controller , action: @station_name , only_path: true )
    else
      url
    end
  end

  def self.train_information( request , station_name )
    self.new(
      request ,
      station_name ,
      "列車運行情報" ,
      "Train information" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_facility( request , station_name )
    self.new(
      request ,
      station_name ,
      "駅施設のご案内" ,
      "Facilities of this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_timetable( request , station_name )
    self.new(
      request ,
      station_name ,
      "駅の時刻表" , # "時刻表（駅別）" ,
      "Timetables of this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.fare( request , station_name )
    self.new(
      request ,
      station_name ,
      "運賃のご案内" ,
      "Fares from this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

end
