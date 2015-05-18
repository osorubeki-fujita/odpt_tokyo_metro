class TokyoMetro::App::Renderer::RealTimeInfos < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_lines , http_client = ::HTTPClient.new )
    super( request )
    @http_client = http_client
    set_railway_lines( railway_lines )
    set_infos_of_each_railway_line

    raise "Error" unless has_any_railway_line?

    set_meta_datum
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

  def has_train_location_infos?
    @infos_of_each_railway_line.map( &:train_location_infos ).flatten.present?
  end

  # @!group render

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
    - if this.has_train_location_infos?
      = this.render_title_of_train_location_infos
      = this.render_train_location_infos
    HAML
  end

  # @!group

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
        = info_of_a_railway_line.railway_line.decorate.render_title_in_train_location
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

    ::TokyoMetro::App::Renderer::Concern::Header::Content.new(
      @request ,
      :title_of_train_operation_infos ,
      :train_operation ,
      ::TrainOperation::InfoDecorator.common_title_ja ,
      ::TrainOperation::InfoDecorator.common_title_en ,
      additional_content: proc_for_additional_content
    ).render
  end

  def render_title_of_train_location_infos
    ::TokyoMetro::App::Renderer::Concern::Header::Content.new(
      @request ,
      :title_of_train_location_infos ,
      :train_location ,
      ::TrainLocationDecorator.common_title_ja ,
      ::TrainLocationDecorator.common_title_en
    ).render
  end

  # @!group Meta Data

  def render_meta_datum( include_train_location_infos: nil )
    @meta_datum.render( include_train_location_infos: include_train_location_infos )
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
      ::TokyoMetro::App::Renderer::RealTimeInfos::EachRailwayLine.new( request , railway_line , @http_client )
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

  def set_meta_datum
    @meta_datum = ::TokyoMetro::App::Renderer::RealTimeInfos::MetaDatum::Whole.new( request , train_operation_infos , train_location_infos )
  end

end