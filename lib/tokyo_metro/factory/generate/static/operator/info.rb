class TokyoMetro::Factory::Generate::Static::Operator::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::WithAttrSameAs

  include ::TokyoMetro::ClassNameLibrary::Static::Operator
  include ::TokyoMetro::Factory::Generate::Static::MetaClass::Polymorphic::TwitterAccount

  def self.hash_keys
    info_class_for_this_class.instance_variable_names
  end

  private

  def set_values_to_hash_for_making_variables
    @hash_for_making_variables[ :name ] = name_instance
    @hash_for_making_variables[ :additional_infos ] = additional_infos
    super( hash_key_array: [ :index ] )
    set_twitter_account_info
  end

  def name_instance
    ::TokyoMetro::Static::Operator::Info::Name.generate_from_hash( @h[ :name ] )
  end

  def additional_infos
    ::TokyoMetro::Static::Operator::Info::AdditionalInfos.generate_from_hash( @h[ :additional_infos ] )
  end

end
