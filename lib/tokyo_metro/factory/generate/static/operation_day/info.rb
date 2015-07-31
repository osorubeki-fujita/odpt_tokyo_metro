class TokyoMetro::Factory::Generate::Static::OperationDay::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::OperationDay

  def initialize(h)
    super( h , with_hash_for_making_variables: false )
  end

  def self.hash_keys
    [ :name_ja , :name_en , :same_as ]
  end

end
