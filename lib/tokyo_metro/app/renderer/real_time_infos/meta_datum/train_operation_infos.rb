class TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainOperationInfos < TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%li{ class: :train_operation_info }
  %ul{ class: :titles }
    = this.render_title
  %ul{ class: :time_infos_of_category }
    = this.render_dc_date_ja
    = this.render_next_update_time_ja
    %ul{ class: [ :en , :text_en ] }<
      = this.render_dc_date_en
      = this.render_next_update_time_en
    HAML
  end

  def render_title
    render_title_of_each_content( :train_operation , ::Train::Operation::InfoDecorator.common_title_ja , ::Train::Operation::InfoDecorator.common_title_en )
  end

end
