class TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::FromRailwayLinePage < TokyoMetro::App::Renderer::Concern::Link::ToRailwayLinePage::ConnectingRailwayLine::MetaClass

  def initialize( request , connecting_railway_line_decorated )
    @display_another_station_info = true
    @display_additional_transfer_info = true
    super( request , connecting_railway_line_decorated )
  end

  private

  def li_classes
    ary = super()
    unless connected_to_jr_lines?
      if connecting_railway_line_object.not_recommended?
        ary << :not_recommended
      end
      if connecting_railway_line_object.cleared?
        ary << :cleared
      end
    end
    ary
  end

  def optional_infos_to_display
    ary = super()
    if has_additional_transfer_info_to_display?
      ary << additional_transfer_info_to_display
    end
    ary
  end

  def has_additional_transfer_info_to_display?
    @display_additional_transfer_info and connecting_railway_line_info_decorator? and ( connecting_railway_line_object.not_recommended? or connecting_railway_line_object.note.present? )
  end

  def additional_transfer_info_to_display
    ::Proc.new {
      h_locals_i = {
        request: request ,
        c_railway_line_decorated: @connecting_railway_line_decorated ,
        note: connecting_railway_line_object.note
      }
      h.render inline: <<-HAML , type: :haml , locals: h_locals_i
- if c_railway_line_decorated.not_recommended? and note.present?
  %div{ class: :remark , note: note.ja }
    = ::TokyoMetro::App::Renderer::Icon.remark( request , 1 ).render
- elsif c_railway_line_decorated.not_recommended?
  %div{ class: :info , note: "別の駅でのお乗り換えをお勧めします。" }
    = ::TokyoMetro::App::Renderer::Icon.info_circle( request , 1 ).render
- elsif note.present?
  %div{ class: :info , note: note.ja }
    = ::TokyoMetro::App::Renderer::Icon.info_circle( request , 1 ).render
      HAML
    }
  end

end