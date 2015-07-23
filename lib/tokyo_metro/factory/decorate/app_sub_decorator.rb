class TokyoMetro::Factory::Decorate::AppSubDecorator < TokyoMetro::Factory::Decorate::Settings

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

  def h_this
    { this: self }
  end

  def h_object
    { o: object }
  end

  def h_decorator
    { d: decorator }
  end

end
