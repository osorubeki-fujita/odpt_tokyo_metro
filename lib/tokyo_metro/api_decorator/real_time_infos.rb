class TokyoMetro::ApiDecorator::RealTimeInfos < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_lines , http_client = ::HTTPClient.new )
    super( request )
    @http_client = http_client
    set_railway_lines( railway_lines )
    set_infos_of_each_railway_line
    raise "Error" unless has_any_railway_line?
    set_time_infos_of_train_operation_infos
    set_time_infos_of_train_location_infos
  end

  attr_reader :infos_of_each_railway_line

  def has_any_railway_line?
    @railway_lines.present?
  end

  def has_one_railway_line?
    @railway_lines.length == 1
  end

  def has_multiple_railway_lines?
    @railway_lines.length > 1
  end

  # @!group 列車位置情報

  def has_train_locations_infos?
    @time_infos_of_train_location_infos.present?
  end

  # @!group render

  def render( make_test: false , add_precise_version: false , include_train_locations: false , controller: :train_information , options: nil )
    if options.present?
      options = [ options ].flatten
    end

    h_locals = {
      this: self ,
      request: @request ,
      make_test: make_test ,
      add_precise_version: add_precise_version ,
      include_train_locations: include_train_locations ,
      controller: controller ,
      index_of_train_location: options.try( :include? , :index_of_train_location )
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :train_informations }
  = this.render_title_of_train_operation_infos( index_of_train_location: index_of_train_location )
  = this.render_train_operation_infos( controller , index_of_train_location )
  - if add_precise_version
    = this.render_train_operation_infos_precise_version
  - if make_test
    = this.render_train_operation_infos_test_version
  - if include_train_locations
    - if this.has_train_locations_infos?
      = this.render_title_of_train_location_infos
      = this.render_train_location_infos
    HAML
  end

  # @!group

  def render_train_operation_infos( controller , index_of_train_location )
    h_locals = {
      this: self ,
      controller: controller ,
      index_of_train_location: index_of_train_location
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
- this.infos_of_each_railway_line.each do | info_of_a_railway_line |
  = info_of_a_railway_line.render_train_operation_info( controller )
    HAML
  end

  def render_train_operation_infos_precise_version
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%div{ class: [ :precise_version_title , :text_ja ] }<
  = ::TrainInformationDecorator.common_title_ja + " " + "詳細版"
- this.infos_of_each_railway_line.each do | info_of_a_railway_line |
  = info_of_a_railway_line.render_train_operation_info_precise_version
    HAML
  end

  def render_train_operation_infos_test_version
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%div{ class: [ :test_title , :text_ja ] }<
  = ::TrainInformationDecorator.common_title_ja + " " + "テスト"
- this.infos_of_each_railway_line.each do | info_of_a_railway_line |
  = info_of_a_railway_line.render_train_operation_info_test_version
    HAML
  end

  def render_train_location_infos
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%div{ id: :train_locations }
  - if this.has_one_railway_line?
    - this.infos_of_each_railway_line.each do | info_of_a_railway_line |
      = info_of_a_railway_line.render_train_location_infos
  - else
    - this.infos_of_each_railway_line.each do | info_of_a_railway_line |
      - if info_of_a_railway_line.train_locations.present?
        = info_of_a_railway_line.railway_line.decorate.render_title_in_train_location
        = info_of_a_railway_line.render_train_location_infos
    HAML
  end

  def render_title_of_train_operation_infos( index_of_train_location: false )
    proc_for_additional_content = ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: { this: self , index_of_train_location: index_of_train_location }
- if index_of_train_location and this.has_train_locations_infos?
  %div{ class: :link_info_to_train_location_of_each_railway_line }
    %div{ class: :icon }<
      = ::TokyoMetro::App::Renderer::Icon.train_location( request , 2 ).render
    %div{ class: :text }<
      %p{ class: :text_ja }<
        = "路線名をクリックすると、各路線で現在運行している列車が表示されます。"
      %p{ class: :text_en }<
        = "To display train locations of each railway line, please click the railway line name."
      HAML
    }

    ::TokyoMetro::App::Renderer::Concern::Header::Content.new(
      @request ,
      :title_of_train_informations ,
      :train_information ,
      ::TrainInformationDecorator.common_title_ja ,
      ::TrainInformationDecorator.common_title_en ,
      additional_content: proc_for_additional_content
    ).render
  end

  def render_title_of_train_location_infos
    ::TokyoMetro::App::Renderer::Concern::Header::Content.new(
      @request ,
      :title_of_train_locations ,
      :train_location ,
      ::TrainLocationDecorator.common_title_ja ,
      ::TrainLocationDecorator.common_title_en
    ).render
  end

  # @!group Meta Data

  def render_meta_datum( include_train_locations: false )
    h_locals = {
      this: self ,
      requset: @requset ,
      include_train_locations: include_train_locations
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :real_time_info_and_update_button , class: :clearfix }
  = this.render_title_of_meta_data
  %ul{ class: :time_infos }
    = this.render_meta_data_of_train_operation_infos
    - if this.has_train_locations_infos?
      - if include_train_locations
        = this.render_meta_data_of_train_location_infos( include_train_locations: true )
      - else
        = this.render_meta_data_of_train_location_infos( include_train_locations: false )
    HAML
  end

  # Title を出力するメソッド
  def render_title_of_meta_data
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

  # 列車運行情報のメタデータを出力するメソッド
  def render_meta_data_of_train_operation_infos
    @time_infos_of_train_operation_infos.render
  end

  # 列車位置情報のメタデータを出力するメソッド
  def render_meta_data_of_train_location_infos( include_delay: true , include_train_locations: false )
    @time_infos_of_train_location_infos.render( include_delay , include_train_locations )
  end

  private

  def set_railway_lines( railway_lines )
    if railway_lines.instance_of?( ::RailwayLine )
      @railway_lines = [ railway_lines ]
    else
      @railway_lines = railway_lines.except_for_branch_lines
    end
  end

  def set_infos_of_each_railway_line
    @infos_of_each_railway_line = ::Array.new( @railway_lines.map { | railway_line |
      ::TokyoMetro::ApiDecorator::RealTimeInfos::EachRailwayLine.new( request , railway_line , @http_client )
    })
  end

  def set_time_infos_of_train_operation_infos
    @time_infos_of_train_operation_infos = ::TokyoMetro::ApiDecorator::RealTimeInfos::TrainOperationInfos.new(
      request ,
      @infos_of_each_railway_line.map( &:train_information ).flatten
    )
  end

  def set_time_infos_of_train_location_infos
    if has_train_locations_infos_on_initialize?
      @time_infos_of_train_location_infos = ::TokyoMetro::ApiDecorator::RealTimeInfos::TrainLocationInfos.new(
        request ,
        @infos_of_each_railway_line.map( &:train_locations ).flatten
      )
    else
      @time_infos_of_train_location_infos = nil
    end
  end
  
  def has_train_locations_infos_on_initialize?
    @infos_of_each_railway_line.map( &:train_locations ).any?( &:present? )
  end

end