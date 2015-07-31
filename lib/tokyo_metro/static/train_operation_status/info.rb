class TokyoMetro::Static::TrainOperationStatus::Info < TokyoMetro::Static::Fundamental::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainOperationStatus

  def initialize( in_api , name_ja )
    @in_api = in_api
    @name_ja = name_ja
  end

  attr_reader :in_api
  attr_reader :name_ja

end
