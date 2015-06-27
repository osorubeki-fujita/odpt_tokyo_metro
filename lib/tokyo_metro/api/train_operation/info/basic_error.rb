class TokyoMetro::Api::TrainOperation::Info::BasicError

  def decorate( request , railway_line , max_delay , controller , no_train )
    decorator_class.new( request , self , railway_line , controller )
  end

  private

  def decorator_class
    raise "This method \'#{ __method__ }\' is not defined in this class \'#{ self.class }\'."
  end

end
