module TokyoMetro::Factory::Decorate::SubDecorator::InDocument::ColorInfo

  # @!group Sub public methods

  def render_color_info( color = nil )
    color ||= object.color_normal
    h.render inline: <<-HAML , type: :haml , locals: { color: color }
%div{ class: :color_info }
  %p{ class: [ :hex_color , :text_en ] }<
    = color
  - if color.present?
    %p{ class: [ :rgb_color , :text_en ] }<
      = color.to_rgb_color_in_parentheses
    HAML
  end

  # @!endgroup

end
