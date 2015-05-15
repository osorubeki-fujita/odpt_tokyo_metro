class TokyoMetro::App::Renderer::SideMenu::Link::List < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , class_name , ul_id , link_instance_names , *opts , additional_proc: nil )
    @request = request
    @ul_id = ul_id
    @link_instances = set_link_instances( class_name , link_instance_names.flatten , opts )
    @additional_proc = additional_proc
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ id: ul_id , class: [ :links , :clearfix ] }
  - link_instances.each do | link_instance |
    = link_instance.render
- if additional_proc.present?
  = additional_proc.call
    HAML
  end

  private

  def set_link_instances( class_name , link_instance_names , opts )
    args = [ @request , opts ].flatten
    link_instance_names.map { | method | class_name.send( method , *args ) }
  end

  def h_locals
    { ul_id: @ul_id , link_instances: @link_instances , additional_proc: @additional_proc }
  end

  def self.to_main_contents( request )
    self.new(
      request ,
      ::TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::Index , "links_#{__method__}" ,
      [
        :top , :train_location , :train_information ,
        :railway_line , :station_facility ,
        # :railway_timetable ,
        :station_timetable , :fare , :passenger_survey
      ]
    )
  end

  def self.to_documents( request )
    self.new(
      request ,
      ::TokyoMetro::App::Renderer::SideMenu::Link::ToDocument , "links_#{__method__}" ,
      [
        :development_document , :how_to_use # ,
        # :disclaimer , :remark , :another_page
      ]
    )
  end

  def self.to_other_websites( request )
    self.new(
      request ,
      ::TokyoMetro::App::Renderer::SideMenu::Link::ToOtherWebsite , "links_#{__method__}" ,
      [ :tokyo_metro_official , :top_of_opendata_contest , :top_for_developer ]
    )
  end

  def self.to_station_info_pages( request , station_info: nil )
    self.new(
      request ,
      ::TokyoMetro::App::Renderer::SideMenu::Link::ToMainContent::OfStation , :links ,
      [ :train_information , :station_facility , :station_timetable , :fare ] ,
      additional_proc: additional_proc_of_links_to_station_info_page( station_info )
    )
  end

  class << self

    private

    def additional_proc_of_links_to_station_info_page( station_info )
      if station_info.blank?
        return nil
      end

      ::Proc.new { station_info.decorate.render_link_to_station_facility_info_of_connecting_other_stations }
    end
  
  end

end