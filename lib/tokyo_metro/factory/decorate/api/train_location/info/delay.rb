class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info::Delay < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def displayed_in_train_operation_info?
    object.displayed_in_train_operation_info?
  end

  def render_in_location_of_each_train
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

end