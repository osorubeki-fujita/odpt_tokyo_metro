class TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::OfStation < TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index

  def initialize( request , title_ja , title_en , station_info , url: nil , controller: nil , icon_name: nil , additional_class_name_of_div_domain: nil )
    @request = request
    @current_station = current_station ,
    @station_info = station_info
    super(
      request ,
      title_ja ,
      title_en ,
      url: url ,
      controller: controller ,
      icon_name: icon_name ,
      additional_class_name_of_div_domain: additional_class_name_of_div_domain
    )
  end

  private

  def set_actual_url( url , controller )
    raise "Error" if url.blank? and controller.blank?
    raise "Error" if url.present? and controller.present?

    #---- Temp
    # puts "recognize_path: #{ recognize_path( fullpath ) }"
    # puts "current_station: #{ @current_station }"

    # if current_station.present?
      # action = current_station
    # else
      # action = current_action
    # end
    #----

    logger.debug "TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::OfStation\#set_actual_url"
    logger.debug "current_station: #{ current_station }"
    logger.debug "station_info (name_in_system): #{ @station_info.name_in_system }"

    if controller.present?
      url_helpers.url_for( controller: controller , action: :action_for_station_page , station: current_station , only_path: true )
    else
      url
    end
  end

  def self.train_operation( request , station_info )
    self.new(
      request ,
      "列車運行情報" ,
      "Train operation info" ,
      station_info ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_facility( request , station_info )
    self.new(
      request ,
      "駅施設のご案内" ,
      "Facilities of this station" ,
      station_info ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_timetable( request , station_info )
    self.new(
      request ,
      "駅の時刻表" , # "時刻表（駅別）" ,
      "Timetables of this station" ,
      station_info ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.fare( request , station_info )
    self.new(
      request ,
      "運賃のご案内" ,
      "Fares from this station" ,
      station_info ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

end
