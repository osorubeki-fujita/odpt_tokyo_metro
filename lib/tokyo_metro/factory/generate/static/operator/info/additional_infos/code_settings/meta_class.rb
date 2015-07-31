class TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionalInfos::CodeSettings::MetaClass < TokyoMetro::Factory::Generate::Static::MetaClass::Info::SubInfo

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    [ :shape , :stroke_width , :text_weight , :text_size ]
  end

  def self.info_class_for_this_class
    raise
  end

end
