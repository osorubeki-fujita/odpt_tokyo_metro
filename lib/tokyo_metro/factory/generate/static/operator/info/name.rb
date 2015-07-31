class TokyoMetro::Factory::Generate::Static::Operator::Info::Name < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    [ :ja , :ja_short , :en , :en_short ]
  end

  def self.info_class_for_this_class
    name_class
  end

  def initialize(h)
    @h = h.with_indifferent_access
    @hash_for_making_variables = ::Hash.new.with_indifferent_access
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :ja , :en ] , make_array: true )
    super( hash_key_array: [ :ja_short , :en_short ] )
  end

end
