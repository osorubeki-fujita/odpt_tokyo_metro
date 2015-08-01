class TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionalInfos::CodeSettings::MetaClass < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    info_class_for_this_class.instance_variable_names
  end

  def self.info_class_for_this_class
    raise
  end

end
