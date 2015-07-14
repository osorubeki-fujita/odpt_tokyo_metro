module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::TrainType

  include ::TokyoMetro::Modules::Decision::MetaClass::TrainType

  private

  def train_type_of?( *variables , compared: @train_type )
    super( *variables , compared )
  end

  alias :is_train_type_of? :train_type_of?

  alias :train_of? :train_type_of?
  alias :is_train_of? :train_of?

end
