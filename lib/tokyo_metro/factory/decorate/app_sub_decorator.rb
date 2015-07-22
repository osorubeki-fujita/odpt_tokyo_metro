class TokyoMetro::Factory::Decorate::AppSubDecorator < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( decorator )
    super( nil )
    @decorator = decorator
  end

  attr_reader :decorator

  def object
    @decorator.object
  end

  private

  def method_missing( method_name , *args )
    begin
      @decorator.send( method_name , *args )
    rescue
      super( method_name , *args )
    end
  end

end
