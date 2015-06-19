module TokyoMetro::Factory::Decorate::AppSubDecorator::InDocument::ColorInfo

  # @!group Sub public methods

  def render_color_info( color = nil ) 
    color ||= object.color
    h.render inline: <<-HAML , type: :haml , locals: { color: color }
%div{ class: :color_info }
  %p{ class: [ :web_color , :text_en ] }<
    = color
  - if color.present?
    %p{ class: [ :rgb_color , :text_en ] }<
      = color.to_rgb_color_in_parentheses
    HAML
  end

  # @!endgroup

end
