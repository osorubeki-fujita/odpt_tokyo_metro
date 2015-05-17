class TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , train_operation_infos , train_location_infos )
    super( request )
    @train_operation_infos = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainOperationInfos.new( request , train_operation_infos )
    if train_location_infos.present?
      @train_location_infos = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainLocationInfos.new( request , train_location_infos )
    else
      @train_location_infos = nil
    end
  end

  attr_reader :train_operation_infos
  attr_reader :train_location_infos

  def render( include_train_locations: nil )
    h.render inline: <<-HAML , type: :haml , locals: h_locals( include_train_locations )
%div{ id: :real_time_info_and_update_button , class: :clearfix }
  = this.render_title
  %ul{ class: :time_infos }
    = this.train_operation_infos.render
    - if this.has_train_location_infos?
      = this.train_location_infos.render( include_train_locations: include_train_locations )
    HAML
  end

  def render_title
    ::TokyoMetro::App::Renderer::Concern::Header::Content.new(
      @request ,
      :real_time_infos ,
      :real_time_infos ,
      "現在表示中のリアルタイム情報" ,
      "About real-time informations" ,
      add_update_button: true ,
      update_button_id: :update_button_in_content_header_of_real_time_infos ,
      contoller_of_updating_real_time_info_form: :update ,
      action_of_updating_real_time_info_form: :normal ,
      icon_size: 2
    ).render
  end
  
  def has_train_location_infos?
    @train_location_infos.present?
  end

  private

  def h_locals( include_train_locations )
    super.merge({
      this: self ,
      include_train_locations: include_train_locations
    })
  end

end