class TokyoMetro::Api::TrainOperation::Info::JsonPerserError < TokyoMetro::Api::TrainOperation::Info::BasicError

  include ::Singleton

  private

  def decorator_class
    ::TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::JsonPerserError
  end

end
