class TokyoMetro::Static::Operator::Info::AdditionalInfos::CodeSettings

  include ::OdptCommon::Modules::Name::Static::Fundamental::Infos
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.instance_variable_names
    [ :railway_line , :station ]
  end

# @param railway_line [String or nil] 路線記号の設定
# @param station [Stirng or nil] 駅番号の設定
  def initialize( railway_line , station )
    @railway_line = railway_line
    @station = station

    # raise
  end

  attr_reader :railway_line
  attr_reader :station

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_instance_of_code_settings
  end

end
