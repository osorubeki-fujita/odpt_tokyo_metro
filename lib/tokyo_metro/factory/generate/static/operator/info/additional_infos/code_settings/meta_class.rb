class TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionalInfos::CodeSettings::MetaClass < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    [ :shape , :stroke_width , :text_weight , :text_size ]
  end

  def self.info_class_for_this_class
    raise
  end

  def initialize(h)
    @h = h.with_indifferent_access
    @hash_for_making_variables = ::Hash.new.with_indifferent_access
  end

end
