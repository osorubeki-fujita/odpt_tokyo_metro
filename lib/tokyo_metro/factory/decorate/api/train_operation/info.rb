class TokyoMetro::Factory::Decorate::Api::TrainOperation::Info < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def initialize( request , obj , railway_line , max_delay , controller , no_train )
    super( request , obj )
    @railway_line = railway_line
    set_max_delay( max_delay )
    @controller = controller
    @no_train = no_train

    @status_type = status_type_on_initialize
  end

  attr_reader :railway_line
  attr_reader :max_delay
  attr_reader :status_type
  attr_reader :controller

  def additional_info_abstruct_ja
    object.train_operation_info_status.try( :name_ja_for_display )
  end

  def additional_info_abstruct_en
    object.train_operation_info_status.try( :name_en_for_display )
  end

  def additional_info_precise_ja
    case @status_type
    when :after_last_train_finished
      "本日の運行は終了しました。"
    when :before_first_train_begin
      "運行開始までお待ち下さい。"
    when :no_train
      "運行中の列車はありません。"
    else
      object.text_in_api
    end
  end

  def additional_info_precise_en
    case @status_type
    when :after_last_train_finished
      "Today's operation was finished."
    when :before_first_train_begin
      "Please wait for the first train."
    when :no_train
      "No train is operated now."
    else
      object.text_en
    end
  end

  def status_text_ja
    case status_type
    when :no_train , :after_last_train_finished , :before_first_train_begin
      "運行中の列車 なし"
    when :on_schedule
      "平常運転"
    when :nearly_on_schedule
      "ほぼ平常運転"
    when :delayed
      "遅れあり"
    when :suspended
      "運転見合わせ"
    when :other_status
      "お知らせ"
    end
  end

  def status_text_en
    case status_type
    when :no_train , :after_last_train_finished , :before_first_train_begin
      "No train is operated now."
    when :on_schedule
      "Now on schedule"
    when :nearly_on_schedule
      "Now on schedule"
    when :delayed
      "Delayed"
    when :suspended
      "Operation suspended"
    when :other_status
      "Information"
    end
  end

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

  def render_status_additional_infos
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
- max_delay_decorator = this.max_delay.decorate( request )
%div{ class: :additional_infos }<
  - if [ this.additional_info_abstruct_ja , max_delay_decorator.displayed_in_train_operation_info? , this.additional_info_precise_ja ].any?( &:present? )
    %div{ class: :text_ja }
      - if this.additional_info_abstruct_ja.present?
        %p{ class: :abstruct }<
          = this.additional_info_abstruct_ja
      - if max_delay_decorator.try( :displayed_in_train_operation_info? )
        = max_delay_decorator.render_ja_in_train_operation_info
      - if this.additional_info_precise_ja.present?
        %p{ class: :precise }<
          = this.additional_info_precise_ja
  - if [ this.additional_info_abstruct_en , max_delay_decorator.displayed_in_train_operation_info? , this.additional_info_precise_en ].any?( &:present? )
    %div{ class: :text_en }
      - if this.additional_info_abstruct_en.present?
        %p{ class: :abstruct }<
          = this.additional_info_abstruct_en
      - if max_delay_decorator.displayed_in_train_operation_info?
        = max_delay_decorator.render_en_in_train_operation_info
      - if this.additional_info_precise_en.present?
        %p{ class: :precise }<
          = this.additional_info_precise_en
    HAML
  end

  private

  def no_train?
    @no_train
  end

  def after_last_train_finishes?
    no_train? and hour_after_last_train_finishes.include?( object.dc_date.hour )
  end
  
  def before_first_train_begins?
    no_train? and hour_before_first_train_begins.include?( object.dc_date.hour )
  end

  def on_schedule?
    object.on_schedule? and @max_delay.on_schedule?
  end

  def nearly_on_schedule?
    object.on_schedule? and @max_delay.nearly_on_schedule?
  end

  def delayed?
    # object.delayed? or @max_delay.delayed?
    @max_delay.delayed?
  end

  def suspended?
    object.suspended?
  end

  def status_type_on_initialize
    if after_last_train_finishes?
      :after_last_train_finished
    elsif before_first_train_begins?
      :before_first_train_begin
    elsif no_train?
      :no_train

    elsif on_schedule?
      :on_schedule
    elsif nearly_on_schedule?
      :nearly_on_schedule
    elsif delayed?
      :delayed
    elsif suspended?
      :suspended
    else
      :other_status
    end
  end

  def set_max_delay( max_delay )
    @max_delay = ::TokyoMetro::Api::TrainLocation::Info::Delay.new( max_delay )
  end

  def hour_after_last_train_finishes
    ( ( 20..23 ).to_a + ( 0...( ::TokyoMetro::DATE_CHANGING_HOUR ) ).to_a ).flatten
  end

  def hour_before_first_train_begins
    ( ( ::TokyoMetro::DATE_CHANGING_HOUR )..6 ).to_a
  end

end