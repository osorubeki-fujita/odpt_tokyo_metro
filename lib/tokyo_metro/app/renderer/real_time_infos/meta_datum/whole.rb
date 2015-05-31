class TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , train_operation_infos , train_location_infos , visibility )
    super( request )
    @visibility = visibility
    @train_operation_infos = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainOperationInfos.new( request , train_operation_infos )
    if train_location_infos.present?
      @train_location_infos = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainLocationInfos.new( request , train_location_infos )
    else
      @train_location_infos = nil
    end
  end

  attr_reader :train_operation_infos
  attr_reader :train_location_infos

  def render( include_train_location_infos: nil )
    h.render inline: <<-HAML , type: :haml , locals: h_locals( include_train_location_infos )
%div{ id: :real_time_info_and_update_button , class: visibility }
  = this.render_header
  %ul{ class: :time_infos }
    = this.train_operation_infos.render
    - if this.has_train_location_infos?
      = this.train_location_infos.render( include_train_location_infos: include_train_location_infos )
    HAML
  end

  def render_header
    ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole::Header.new( @request , @visibility ).render
  end

  def has_train_location_infos?
    @train_location_infos.present?
  end

  private

  def h_locals( include_train_location_infos )
    super().merge({
      this: self ,
      include_train_location_infos: include_train_location_infos ,
      visibility: @visibility
    })
  end

end