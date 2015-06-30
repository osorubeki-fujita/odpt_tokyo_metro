class TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental

  def initialize( object )
    @object = object
  end

  attr_reader :object

  def self.process( *args )
    self.new( *args ).process
  end

end
