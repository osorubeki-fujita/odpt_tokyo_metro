class TokyoMetro::Factory::Get::Api::MetaClass::Find < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental

  # Constructor
  def initialize( data_id , *args )
    super( *args )
    @data_id = data_id
  end

  def self.process( http_client , *args )
    self.new( *args ).get_data( http_client )
  end

  private

  def generate_new_array_instance( ary )
    ::TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Find.process( ary )
  end

end
