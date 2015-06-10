class TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::TrainLocationInfos < TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::MetaClass

  def frequency
    @time_infos.map( &:frequency ).sort.uniq
  end

  # 列車位置情報のメタデータを出力するメソッド
  def render( include_train_location_infos: false , include_delay: true )
    raise "Error" unless [ include_delay , include_train_location_infos ].all?( &:boolean? )
    raise "Error" if !( include_delay ) and !( include_train_location_infos )
    h_locals = {
      this: self ,
      include_delay: include_delay ,
      include_train_location_infos: include_train_location_infos
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: :train_location_infos }
  = this.render_title( include_train_location_infos , include_delay )
  = this.render_meta_data
    HAML
  end

  def render_title( include_train_location_infos , include_delay )
    h_locals_i = {
      this: self ,
      include_train_location_infos: include_train_location_infos ,
      include_delay: include_delay
    }
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%ul{ class: :titles }
  - if include_train_location_infos
    = this.render_title_of_train_location_infos
  - if include_delay
    = this.render_title_of_current_delay
    HAML
  end

  def render_title_of_current_delay
    render_title_of_each_content( :delay , "現在の遅れ" , "Delay" )
  end

  def render_title_of_train_location_infos
    render_title_of_each_content( :train_location , ::TrainLocationDecorator.common_title_ja , ::TrainLocationDecorator.common_title_en )
  end

  def render_meta_data
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%ul{ class: :time_infos_of_category }
  = this.render_dc_date_ja
  = this.render_next_update_time_ja
  = this.render_frequency_ja
  %ul{ class: [ :en , :text_en ] }<
    = this.render_dc_date_en
    = this.render_next_update_time_en
    = this.render_frequency_en
    HAML
  end

  def render_frequency_ja
    render_frequency( "#{ frequency_to_s }秒ごとに更新" )
  end

  def render_frequency_en
    render_frequency( "Updates at intervals of #{ frequency_to_s } seconds." )
  end

  private

  def frequency_to_s
    time_for_display( frequency , lang: nil )
  end

  def render_frequency( str )
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%li{ class: :frequency }<
  = str
    HAML
  end

end
