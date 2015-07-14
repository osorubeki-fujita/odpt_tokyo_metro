class TokyoMetro::Static::TrainOperationStatus::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainOperationStatus
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Info

  def initialize( in_api , name_ja )
    @in_api = in_api
    @name_ja = name_ja
  end

  attr_reader :in_api
  attr_reader :name_ja

end
