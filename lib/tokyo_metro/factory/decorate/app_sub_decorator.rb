class TokyoMetro::Factory::Decorate::AppSubDecorator < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( decorator , request = nil )
    super( request )
    @decorator = decorator
  end

  attr_reader :decorator

  def object
    @decorator.object
  end

  def on( request )
    @request = request

    return self
  end

  private

  def method_missing( method_name , *args )
    begin
      @decorator.send( method_name , *args )
    rescue
      super( method_name , *args )
    end
  end

  def h_decorator
    { decorator: decorator }
  end

end
