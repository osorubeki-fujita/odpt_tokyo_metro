class TokyoMetro::ApiDecorator::RealTimeInfos::TrainLocationInfos < TokyoMetro::ApiDecorator::RealTimeInfos::Category::MetaClass

  def frequency
    @time_infos_of_train_locations.map( &:frequency ).sort.uniq
  end
  
  def render( include_delay , include_train_locations )
    raise "Error" if !( include_delay ) and !( include_train_locations )
    h_locals = {
      this: self ,
      include_delay: include_delay ,
      include_train_locations: include_train_locations
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
%li{ class: :train_locations }
  = this.render_title( include_delay , include_train_locations )
  = this.render_meta_data
    HAML
  end

  def render_title( include_delay , include_train_locations )
    h_locals_i = super.merge({
      include_delay: include_delay ,
      include_train_locations: include_train_locations
    })
    h.render inline: <<-HAML , type: :haml , locals: h_locals_i
%ul{ class: :titles }
  - if include_delay
    = this.render_title_of_current_delay
  - if include_train_locations
    = this.render_title_of_train_locations
    HAML
  end

  def render_title_of_current_delay
    render_title_of_each_content( :delay , "現在の遅れ" , "Delay" )
  end

  def render_title_of_train_locations
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
    frequency_of_train_location_info.map( &:to_s ).join( " - " )
  end

  def render_frequency( str )
    h.render inline: <<-HAML , type: :haml , locals: { str: str }
%li{ class: :frequency }<
  = str
    HAML
  end

end