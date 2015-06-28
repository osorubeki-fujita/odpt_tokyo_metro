class TokyoMetro::Api::TrainOperation::Info::JsonParserError < TokyoMetro::Api::TrainOperation::Info::BasicError

  include ::Singleton

  private

  def decorator_class
    ::TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::JsonParserError
  end

end
