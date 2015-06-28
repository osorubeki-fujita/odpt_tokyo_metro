class TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Common

  def process
    _info_class = info_class
    list_class.new( @ary.map { | item |
      _info_class.generate_from_hash( item )
    } )
  end

  private

  def check_validity_of_ary
    raise unless @ary.all? { | item | item.instance_of?( ::Hash ) }
  end

  def list_class
    @namespace.list_class
  end

  def info_class
    @namespace.info_class
  end

end
