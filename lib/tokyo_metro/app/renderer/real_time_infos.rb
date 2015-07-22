class TokyoMetro::App::Renderer::RealTimeInfos < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_infos , http_client = ::HTTPClient.new , visibility: :visible , test_mode: nil )
    super( request )
    @http_client = http_client
    @visibility = visibility
    @test_mode = test_mode

    set_railway_line_infos( railway_line_infos )
    set_infos_of_each_railway_line

    raise unless has_any_railway_line?

    set_meta_datum
  end

  attr_reader :infos_of_each_railway_line

  # @!group 判定 - 路線

  def has_any_railway_line?
    @railway_line_infos.present?
  end

  def has_one_railway_line?
    @railway_line_infos.length == 1
  end

  def has_multiple_railway_line_infos?
    @railway_line_infos.length > 1
  end

  # @!group 判定 - 列車位置情報

  def has_train_location_infos?
    @infos_of_each_railway_line.map( &:train_location_infos ).flatten.present?
  end

  def has_valid_train_location_infos?
    valid_train_location_infos.present?
  end

  def update_train_operation_text_in_db
    @infos_of_each_railway_line.each do | info_of_railway_line |
      info_of_railway_line.update_train_operation_text_in_db
    end
  end

  # @!group render - (1) Main

  def render( include_train_location_infos: false , controller: :train_operation , options: nil )
    if options.present?
      options = [ options ].flatten
    end

    h_locals = {
      this: self ,
      request: @request ,
      include_train_location_infos: include_train_location_infos ,
      controller: controller ,
      add_index_of_train_location: options.try( :include? , :add_index_of_train_location )
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :train_operation_infos }
  = this.render_title_of_train_operation_infos( add_index_of_train_location: add_index_of_train_location )
  = this.render_train_operation_infos( controller )
  - if include_train_location_infos
    - if this.has_valid_train_location_infos?
      = this.render_title_of_train_location_infos
      = this.render_train_location_infos
    HAML
  end

  # @!group render - 2. Sub

  def render_train_operation_infos( controller )
    h_locals = {
      this: self ,
      controller: controller
    }

    h.render inline: <<-HAML , type: :haml , locals: h_locals
- this.infos_of_each_railway_line.each do | info_of_a_railway_line |
  = info_of_a_railway_line.render_train_operation_info( controller )
    HAML
  end

  def render_train_location_infos
    h.render inline: <<-HAML , type: :haml , locals: { this: self }
%div{ id: :train_location_infos }
  - if this.has_one_railway_line?
    - this.infos_of_each_railway_line.each do | info_of_a_railway_line |
      = info_of_a_railway_line.render_train_location_infos
  - else
    - this.infos_of_each_railway_line.each do | info_of_a_railway_line |
      - if info_of_a_railway_line.train_location_infos.present?
        = info_of_a_railway_line.railway_line.decorate.title.render_in_train_location_info
        = info_of_a_railway_line.render_train_location_infos
    HAML
  end

  def render_title_of_train_operation_infos( add_index_of_train_location: false )
    proc_for_additional_content = ::Proc.new {
      h.render inline: <<-HAML , type: :haml , locals: { this: self , add_index_of_train_location: add_index_of_train_location }
- if add_index_of_train_location and this.has_train_location_infos?
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

    ::TokyoMetro::App::Renderer::Concerns::Header::Content.new(
      @request ,
      :title_of_train_operation_infos ,
      :train_operation ,
      ::Train::Operation::InfoDecorator.common_title_ja ,
      ::Train::Operation::InfoDecorator.common_title_en ,
      additional_content: proc_for_additional_content
    ).render
  end

  def render_title_of_train_location_infos
    ::TokyoMetro::App::Renderer::Concerns::Header::Content.new(
      @request ,
      :title_of_train_location_infos ,
      :train_location ,
      ::Train::Location::InfoDecorator.common_title_ja ,
      ::Train::Location::InfoDecorator.common_title_en
    ).render
  end

  # @!group render - 3. Meta Data

  def render_meta_datum( include_train_location_infos: nil )
    @meta_datum.try( :render , include_train_location_infos: include_train_location_infos )
  end

  # @!group Loop

  # 定期実行する処理
  def self.process_in_loop
    if on_rails_application?
      puts "process_in_loop"
      self.new( nil , ::Railway::Line::Info.tokyo_metro , visibility: :hidden ).update_train_operation_text_in_db
    end
    return nil
  end

  private

  def set_railway_line_infos( railway_line_infos )
    if railway_line_infos.instance_of?( ::Railway::Line::Info )
      @railway_line_infos = [ railway_line_infos ]
    else
      @railway_line_infos = railway_line_infos.except_for_branch_lines
    end
  end

  def set_infos_of_each_railway_line
    @infos_of_each_railway_line = ::Array.new( @railway_line_infos.map { | railway_line_info |
      ::TokyoMetro::App::Renderer::RealTimeInfos::EachRailwayLine.new( request , railway_line_info , @http_client , @test_mode)
    })
  end

  def train_operation_infos
    @infos_of_each_railway_line.map( &:train_operation_info ).flatten
  end

  def train_location_infos
    if has_train_location_infos?
      @infos_of_each_railway_line.map( &:train_location_infos ).flatten
    else
      nil
    end
  end

  def valid_train_operation_infos
    train_operation_infos.keep_if { | item | item.instance_of?( ::TokyoMetro::Api::TrainOperation::Info ) }
  end

  def valid_train_location_infos
    train_location_infos.try( :select , &:present? )
  end

  def set_meta_datum
    if valid_train_operation_infos.present?
      @meta_datum = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole.new( request , valid_train_operation_infos , valid_train_location_infos , @visibility )
    else
      @meta_datum = nil
    end
  end

end
