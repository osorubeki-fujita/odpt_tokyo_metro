class TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Common
  
  private
  
  def check_validity_of_ary
    raise unless @ary.all? { | item | item.instance_of?( ::Hash ) }
  end

  def process
    _info_class = info_class
    list_class.new( ary.map { | item |
      _info_class.generate_from_hash( item )
    } )
  end
  
end