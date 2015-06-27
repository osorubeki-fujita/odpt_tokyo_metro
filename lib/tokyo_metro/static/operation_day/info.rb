class TokyoMetro::Static::OperationDay::Info

  include ::TokyoMetro::ClassNameLibrary::Static::OperationDay
  include ::TokyoMetro::Modules::Common::ToFactory::Generate::Info
  include ::TokyoMetro::Modules::Common::ToFactory::Seed::Info

  def initialize( name_ja , name_en , same_as )
    @name_ja = name_ja
    @name_en = name_en
    @same_as = same_as
  end

  attr_reader :name_ja
  attr_reader :name_en
  attr_reader :same_as

  alias :ja :name_ja
  alias :en :name_en

  def to_a
    [ @name_ja , @name_en , @same_as ]
  end

  def to_h
    { name_ja: @name_ja , name_en: @name_en , same_as: @same_as }
  end

  def match?( operation_day )
    self.to_a.include?( operation_day ) or @name_en.gsub( /\,? / , "_" ).downcase.to_s == operation_day.to_s
  end

end
