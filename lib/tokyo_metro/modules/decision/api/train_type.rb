module TokyoMetro::Modules::Decision::Api::TrainType

  include ::TokyoMetro::Modules::Decision::Common::TrainType

  private

  def train_type_of?( *args , compared: @train_type )
    super( *args , compared )
  end

  alias :is_train_type_of? :train_type_of?

  def train_of?( *args , compared: @train_name )
    super( *args , compared )
  end

  alias :is_train_of? :train_of?

end
