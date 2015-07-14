module TokyoMetro::Modules::Decision::Db::TrainType

  include ::TokyoMetro::Modules::Decision::Common::TrainType

  private

  def train_type_of?( *args )
    super( *args , train_type_info.same_as )
  end

  alias :is_train_type_of? :train_type_of?

  def train_of?( *args )
    super( *args , train_name.same_as )
  end

  alias :is_train_of? :train_of?

end
