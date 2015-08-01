class TokyoMetro::Static::Operator::Info::AdditionalInfos

  include ::OdptCommon::Modules::Name::Static::Fundamental::Infos
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.instance_variable_names
    [ :color , :numbering , :code , :code_settings ]
  end

  # @param color [::TokyoMetro::Static::Color] 事業者の色
  # @param numbering [Boolean] 駅ナンバリングを実施しているか否か
  def initialize( color , numbering , code , code_settings )
    @color = color
    @numbering = numbering
    @code = code
    @code_settings = code_settings
  end

  attr_reader :color
  attr_reader :numbering
  attr_reader :code
  attr_reader :code_settings

  def with_station_number?
    @numbering
  end

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_instance_of_additional_infos
  end

end
