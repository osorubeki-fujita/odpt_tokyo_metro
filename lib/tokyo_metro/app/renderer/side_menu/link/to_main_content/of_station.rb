class TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::OfStation < TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index

  def initialize( request , title_ja , title_en , url: nil , controller: nil , icon_name: nil , additional_class_name_of_text_domain: nil )
    @request = request
    @current_station = current_station
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

    #---- Temp
    # puts "recognize_path: #{ recognize_path( fullpath ) }"
    # puts "current_station: #{ @current_station }"
    if current_station.present?
      action = current_station
    else
      action = current_action
    end
    #----

    if controller.present?
      url_helpers.url_for( controller: controller , action: action , only_path: true )
    else
      url
    end
  end

  def self.train_operation( request )
    self.new(
      request ,
      "列車運行情報" ,
      "Train operation info" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_facility( request )
    self.new(
      request ,
      "駅施設のご案内" ,
      "Facilities of this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_timetable( request )
    self.new(
      request ,
      "駅の時刻表" , # "時刻表（駅別）" ,
      "Timetables of this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.fare( request )
    self.new(
      request ,
      "運賃のご案内" ,
      "Fares from this station" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

end
