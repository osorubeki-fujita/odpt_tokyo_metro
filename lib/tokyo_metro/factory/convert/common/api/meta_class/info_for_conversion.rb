class TokyoMetro::Factory::Convert::Common::Api::MetaClass::InfoForConversion

  def initialize( for_conversion , attr_of_info , method_for_deciding_default_value , arrow_blank: true )
    @for_conversion = for_conversion
    @attr_of_info = attr_of_info
    @method_for_deciding_default_value = method_for_deciding_default_value
    @arrow_blank = arrow_blank
  end

  def match?( info )
    valid_blank? or ( class_is_valid? and info.send( @attr_of_info ) == @for_conversion ) or ( hash_for_conversion_is_set? and info.send( @attr_of_info ) == convert_from and convert_from.send( @method_for_deciding_default_value ) )
  end

  def process
    ::Proc.new { | info |
      if to_process?( info )
        info.instance_variable_set( "@#{ @attr_of_info }" , convert_to )
      end
    }
  end

  private

  def arrow_blank?
    @arrow_blank
  end

  def valid_blank?
    arrow_blank? and @for_conversion.blank?
  end

  def class_is_valid?
    @for_conversion.send( @method_for_deciding_default_value )
  end

  def hash_for_conversion_is_set?
    @for_conversion.instance_of?( ::Hash )
  end

  def to_process?( info )
    hash_for_conversion_is_set? and convert_to.present? and convert_to.send( @method_for_deciding_default_value ) and info.send( @attr_of_info ) == convert_from
  end

  def convert_from
    @for_conversion[ :from ]
  end

  def convert_to
    @for_conversion[ :to ]
  end

end
