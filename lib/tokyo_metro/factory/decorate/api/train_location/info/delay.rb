class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info::Delay < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def displayed_in_train_operation_info?
    object.displayed_in_train_operation_info?
  end

  def render_in_location_of_each_train
    if object.on_schedule?
      render_in_location_of_each_train_when_on_schedule
    else
      render_in_location_of_each_train_when_delayed
    end
  end

  def render_ja_in_train_operation_info
    str = "現在の遅れ 最大 #{ object.to_s_ja }"
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%p{ class: :max_delay }<
  = str
    HAML
  end

  def render_en_in_train_operation_info
    str = "Max delay: #{ object.to_s_en }"
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%p{ class: :max_delay }<
  = str
    HAML
  end

  def render_in_train_operation_info_precise_version
    str = "最大遅れ：#{ object.delay.to_s }秒"
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%div{ class: :max_delay }<
  = str
    HAML
  end

  private

  def render_in_location_of_each_train_when_on_schedule
    h.render inline: <<-HAML , type: :haml , locals: { request: request }
%div{ class: [ :on_schedule , :clearfix ] }
  = ::TokyoMetro::App::Renderer::Icon.on_schedule( request , 2 ).render
  %div{ class: :text }
    %p{ class: :text_ja }<
      = "平常運転"
    %p{ class: :text_en }<
      = "Now on schedule"
    HAML
  end

  def render_in_location_of_each_train_when_delayed
    main_str = object.to_s_separated_by_comma
    h.render inline: <<-HAML , type: :haml , locals: { main_str: main_str }
%div{ class: [ :delay , :clearfix ] }
  %div{ class: :title_of_delay }
    %p{ class: :text_ja }<>
      = "遅れ"
      %span{ class: :small }<
        = "（分：秒）"
    %p{ class: :text_en }<>
      = "Delay"
      %span{ class: :small }<
        = "(mm:ss)"
  %div{ class: [ :time , :text_en ] }<
    = main_str
    HAML
  end

end