class TokyoMetro::Factory::Decorate::AppSubDecorator::InDocument < TokyoMetro::Factory::Decorate::AppSubDecorator

  def render_infos
    h.render inline: <<-HAML , type: :haml , locals: { infos: infos_to_render }
%ul{ class: [ :sub_infos , :clearfix ] }
  - infos.each do | title , attrs |
    %li{ class: [ :title , :text_en ] }<
      = title
    %dl{ class: :clearfix }
      - attrs.each do | info_attr |
        - if info_attr.instance_of?( ::String ) or info_attr.instance_of?( ::Symbol )
          - info = this.send( info_attr )
        - elsif info_attr.instance_of?( ::Proc )
          - info = info_attr.call( this )
        - if info.present?
          %dt{ class: [ :attr_title , :text_en ] }<
            = info_attr.to_s + " :"
          %dd<
            = info
    HAML
  end

  private
  
  def infos_to_render
    raise "This method \'#{ __method__ }\' is not defined in \'#{ self.class }\'."
  end

  def render_name( regexp , name_str , p_class )
    _h_locals = {
      this: self ,
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
