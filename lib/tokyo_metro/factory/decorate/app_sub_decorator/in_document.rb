class TokyoMetro::Factory::Decorate::AppSubDecorator::InDocument < TokyoMetro::Factory::Decorate::AppSubDecorator

  def render_button_domain
    h.content_tag( :div , '' , class: [ :button_area , :clearfix ] )
  end

  def render_id_and_size_changing_buttons
    h.render inline: <<-HAML , type: :haml , locals: { number: object.id }
%div{ class: [ :header , :clearfix ] }
  %div{ class: [ :number , :text_en ] }<
    = number
  = ::TokyoMetro::App::Renderer::Document::SizeChangingButton.new( nil ).render
    HAML
  end

  def render_infos
    h.render inline: <<-HAML , type: :haml , locals: { infos: infos_to_render }
%ul{ class: [ :sub_infos , :display , :clearfix ] }
  - infos.each do | title , group |
    %li{ class: [ :title , :text_en ] }<
      = title
    %dl{ class: :clearfix }
      - group.each do | k , v |
        - if v.present?
          %dt{ class: [ :attr_title , :text_en ] }<
            = k.to_s + " :"
          %dd<
            = v.to_s
    HAML
  end

  private

  def infos_to_render
    { "Infos from Db Columns" => infos_from_db_columns }
  end

  def infos_from_db_columns
    infors_from_db_columns_of( object )
  end

  def infors_from_db_columns_of( obj )
    infos_from_methods_of( obj , obj.class.attribute_names )
  end

  def infos_from_methods_of_object( *method_names )
    infos_from_methods_of( object , *method_names )
  end

  def infos_from_methods_of_decorator( *method_names )
    infos_from_methods_of( @decorator , *method_names )
  end

  def infos_from_methods_of( obj , *method_names )
    h = ::Hash.new
    method_names.flatten.each do | method_name |
      h[ method_name ] = obj.send( method_name )
    end
    h
  end

  def infos_from_db_columns_of_multiple( objs , title )
    if objs.present?
      infos_from_method_of_multiple( objs , title )
    else
      ::Hash.new
    end
  end

  def infos_from_method_of_multiple( objs , title , *method_names )
    h = ::Hash.new

    if objs.length == 1
      h[ title ] = infors_from_db_columns_of( objs.first )
    else
      objs.to_a.each.with_index(1) do | item , i |
        h[ "#{ title } \##{ i }" ] = infors_from_db_columns_of( item )
      end
    end

    h
  end

  def render_name( regexp , name_str , p_class )
    _h_locals = {
      regexp: regexp ,
      name_str: name_str ,
      p_class: p_class
    }
    h.render inline: <<-HAML , type: :haml , locals: _h_locals
%p{ class: p_class }<
  - if regexp =~ name_str
    - out_of_parentheses = name_str.gsub( regexp , "" )
    - in_parentheses =  $1
    = out_of_parentheses
    %span{ class: :sub }<
      = in_parentheses
  - else
    = name_str
    HAML
  end

end
