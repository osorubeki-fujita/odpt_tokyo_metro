class TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental

  def updated
    process
    return @object
  end

  def self.updated( *args )
    return self.new( *args ).updated
  end

end
