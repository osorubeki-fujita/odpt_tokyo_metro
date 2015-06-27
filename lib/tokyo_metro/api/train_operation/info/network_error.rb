class TokyoMetro::Api::TrainOperation::Info::NetworkError < TokyoMetro::Api::TrainOperation::Info::BasicError

  include ::Singleton
  
  private
  
  def decorator_class
    ::TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::NetworkError
  end

end
