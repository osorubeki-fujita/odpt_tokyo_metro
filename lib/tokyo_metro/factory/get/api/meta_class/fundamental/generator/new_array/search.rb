class TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Search < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Common

  def initialize( ary , namespace )
    @ary = ary
    @namespace = namespace
    check_validity_of_ary
  end

  def self.process( ary , namespace )
    self.new( ary , namespace ).process
  end

end
