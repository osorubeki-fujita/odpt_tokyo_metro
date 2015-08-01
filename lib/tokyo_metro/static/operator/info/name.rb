class TokyoMetro::Static::Operator::Info::Name

  include ::OdptCommon::Modules::Name::Static::Fundamental::Infos
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.instance_variable_names
    [ :ja , :hira , :en , :ja_short , :hira_short , :en_short ]
  end

  # @param ja [::Array <::String>] 事業者の名称（日本語、正式名）
  # @param ja_short [String] 事業者の名称（日本語、略称・表示用）
  # @param en [::Array <::String>] 事業者の名称（ローマ字表記、正式名）
  # @param en_short [String] 事業者の名称（ローマ字表記、略称・表示用）
  def initialize( ja , hira , en , ja_short , hira_short , en_short )
    @ja = ja
    @hira = hira
    @en = en

    @ja_short = ja_short
    @hira_short = hira_short
    @en_short = en_short
  end

  attr_reader :ja
  attr_reader :hira
  attr_reader :en

  attr_reader :ja_short
  attr_reader :hira_short
  attr_reader :en_short

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_instance_of_name
  end

end
