class TokyoMetro::ApiDecorator::RealTimeInfos::Category::MetaClass < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , time_infos )
    super( request )
    @time_infos = time_infos
  end

  def render_dc_date_ja
    render_time_info_ja( dc_date_times , :dc_date , "データ生成時刻" )
  end

  def render_dc_date_en
    render_time_info_en( dc_date_times , :dc_date , "As of" )
  end

  def render_next_update_time_ja
    render_time_info_ja( validity_times , :validity , "データ有効期限・次回更新予定" )
  end

  def render_next_update_time_en
    render_time_info_en( validity_times , :validity , "Next Update:" )
  end

  private

  def dc_date_times
    @time_infos.map( &:dc_date ).sort.uniq
  end

  def validity_times
    @time_infos.map( &:validity ).sort.uniq
  end

  def next_update
    validity_times
  end
  
  def render_title_of_each_content( icon_name , text_ja , text_en )
    h.render inline: <<-HAML , type: :haml , locals: { request: request , icon_name , text_ja , text_en }
%li{ class: [ :title , :clearfix ] }<
  %div{ class: :icon }<
    = ::TokyoMetro::App::Renderer::Icon.send( icon_name , request , 1 ).render
  %div{ class: :text }
    %p{ class: :text_ja }<
      = text_ja
    %p{ class: :text_en }<
      = text_en
    HAML
  end

  def render_time_info_ja( time_infos , li_class , title )
    h_locals_i = {
      time_for_display: time_for_display( time_infos , lang: :ja ) ,
      li_classes: li_classes ,
      title: title
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%li{ class: li_classes }
  %div{ class: [ :title_of_time_info , :text_ja ] }<
    = title + "："
  %div{ class: :time }<
    = time_for_display
    HAML
  end

  def render_time_info_en( time_infos , li_class , title )
    h_locals_i = {
      time_for_display: time_for_display( time_infos , lang: :en ) ,
      li_classes: li_classes ,
      title: title
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%li{ class: [ li_classes , :clearfix ].flatten }
  %div{ class: :title_of_time_info_en }<
    = title
  %div{ class: :time_en }<
    = time_for_display
    HAML
  end

  def time_for_display( time_infos , lang: nil )
    str_ary = time_str_ary( time_infos , lang )
    if str_ary.length <= 2
      str_ary.join( " - " )
    else
      [ str_ary.first , str_ary.last ].join( " - " )
    end
  end

  def time_str_ary( time_infos , lang )
    raise "Error" unless lang == :ja or lang == :en
    case lang
    when :ja
      time_infos.map( &:to_strf_normal_ja )
    when :en
      time_infos.map( &:to_strf_normal_en )
    end
  end
  
  def h_locals
    super().merge({
      this: self
    })
  end
  
end