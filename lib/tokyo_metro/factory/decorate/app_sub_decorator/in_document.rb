class TokyoMetro::Factory::Decorate::AppSubDecorator::InDocument < TokyoMetro::Factory::Decorate::AppSubDecorator

  def render_infos
    h.render inline: <<-HAML , type: :haml , locals: { infos: infos_to_render }
%ul{ class: [ :sub_infos , :clearfix ] }
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
    infos_from_methods_of_object( object.class.attribute_names )
  end

  def infos_from_methods_of_object( method_names )
    h = ::Hash.new
    method_names.each do | method_name |
      h[k] = object.send( method_name )
    end
    h
  end

  def infos_from_methods_of_decorator( method_names )
    infos_from_methods_of( @decorator , method_names )
  end

  def infos_from_methods_of( obj , method_names )
    h = ::Hash.new
    method_names.each do | method_name |
      h[k] = obj.send( method_name )
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
