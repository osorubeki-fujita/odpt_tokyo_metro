class TokyoMetro::Factory::Decorate::AppSubDecorator

  def initialize( decorator )
    @decorator = decorator
  end

  attr_reader :decorator

  def object
    @decorator.object
  end

  def method_missing( method_name , *args )
    @decorator.send( method_name , *args )
  end

  private

  def h
    ::ActionView::Base.new
  end

  def self.h
    ::ActionView::Base.new
  end

end
