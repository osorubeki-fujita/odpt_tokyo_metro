class TokyoMetro::Factory::Generate::Static::TrainOperationStatus::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::TrainOperationStatus

  def initialize(h)
    super( h , with_hash_for_making_variables: false )
  end

  def self.hash_keys
    [ :in_api , :name_ja ]
  end

end
