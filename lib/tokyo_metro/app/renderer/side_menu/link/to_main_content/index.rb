class TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index < TokyoMetro::App::Renderer::SideMenu::Link::MetaClass

  def initialize( request  , title_ja , title_en , url: nil , controller: nil , icon_name: nil , additional_class_name_of_text_domain: nil )
    actual_url = set_actual_url( url , controller )
    actual_class_name_of_text_domain = set_actual_class_name_of_text_domain( additional_class_name_of_text_domain )

    super(
      request ,
      title_ja ,
      title_en ,
      actual_url ,
      icon_name: icon_name ,
      class_name_of_link: :link ,
      class_name_of_text_domain: actual_class_name_of_text_domain ,
      open_another_window: false ,
      size: :normal
    )
  end

  private

  def set_actual_url( url , controller )
    raise "Error" if url.blank? and controller.blank?
    raise "Error" if url.present? and controller.present?
    if controller.present?
      url_helpers.url_for( controller: controller , action: :index , only_path: true )
    else
      url
    end
  end

  def set_actual_class_name_of_text_domain( additional_class_name_of_text_domain )
    ary = [ :link_to_content ]
    if additional_class_name_of_text_domain.present?
      ary << additional_class_name_of_text_domain
      ary = ary.flatten
    end
    ary
  end

  def self.top( request )
    top = self.new(
      request ,
      nil ,
      "Top" ,
      controller: :application ,
      icon_name: __method__
    )

    class << top
      def link_for_page_on_the_same_category?
        super and link_for_page_of_the_same_action?
      end
    end

    top
  end

  def self.train_location( request )
    self.new(
      request ,
      "現在運行中の列車" ,
      "Train location info" ,
      controller: __method__ ,
      icon_name: __method__
    )
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

  def self.railway_line( request )
    self.new(
      request ,
      "路線のご案内" ,
      "Railway lines" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_facility( request )
    self.new(
      request ,
      "駅のご案内" ,
      "Stations" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.railway_timetable( request )
    self.new(
      request ,
      "時刻表（路線別）" ,
      "Timetables of railway lines" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.station_timetable( request )
    self.new(
      request ,
      "各駅の時刻表" , # "時刻表（駅別）" ,
      "Timetables of stations" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.fare( request )
    self.new(
      request ,
      "運賃のご案内" ,
      "Fares" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

  def self.passenger_survey( request )
    self.new(
      request ,
      "各駅の乗降客数" ,
      "Passenger surveys" ,
      controller: __method__ ,
      icon_name: __method__
    )
  end

end