class TokyoMetro::Factory::Decorate::Api::TrainOperation::Common < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def initialize( request , obj , railway_line , controller )
    super( request , obj )
    @railway_line = railway_line
    @controller = controller
  end

  attr_reader :railway_line
  attr_reader :controller
  attr_reader :status_type

  def render
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%li{ class: [ :train_operation_info , :railway_line , :clearfix ] }
  = this.railway_line.decorate.render_matrix( make_link_to_railway_line: true , size: :small , link_controller_name: this.controller )
  %div{ class: [ :status , this.status_type ] }
    %div{ class: :infos }
      = this.render_status_icon_and_text
      = this.render_status_additional_infos
    HAML
  end

  def render_status_icon_and_text
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%div{ class: :icon }<
  = ::TokyoMetro::App::Renderer::Icon.send( this.status_type , request , 3 ).render
%div{ class: :text }
  %p{ class: :text_ja }<
    = this.status_text_ja
  %p{ class: :text_en }<
    = this.status_text_en
    HAML
  end
  
end
