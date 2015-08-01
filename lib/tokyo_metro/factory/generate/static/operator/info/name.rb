class TokyoMetro::Factory::Generate::Static::Operator::Info::Name < TokyoMetro::Factory::Generate::Static::MetaClass::Info::SubInfo

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    info_class_for_this_class.instance_variable_names
  end

  def self.info_class_for_this_class
    name_class
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :ja , :en , :hira ] , make_array: true )
    super( hash_key_array: [ :ja_short , :hira_short , :en_short ] )
    raise unless @hash_for_making_variables[ :hira ].array?
    raise unless @hash_for_making_variables[ :hira ].delete_if( &:nil? ).present?
  end

end
