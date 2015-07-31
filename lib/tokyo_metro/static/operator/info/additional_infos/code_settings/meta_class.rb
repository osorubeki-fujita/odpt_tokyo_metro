class TokyoMetro::Static::Operator::Info::AdditionalInfos::CodeSettings::MetaClass

  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def initialize( shape , stroke_width , text_weight , text_size )
    @shape = shape
    @stroke_width = stroke_width
    @text_weight = text_weight
    @text_size = text_size
  end

  attr_reader :shape
  attr_reader :stroke_width
  attr_reader :text_weight
  attr_reader :text_size

end
