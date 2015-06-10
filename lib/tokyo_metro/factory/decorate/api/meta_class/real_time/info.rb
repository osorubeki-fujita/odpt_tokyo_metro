class TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , obj )
    super( request )
    @object = obj
  end

  attr_reader :object

end
