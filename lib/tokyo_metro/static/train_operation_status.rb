class TokyoMetro::Static::TrainOperationStatus < TokyoMetro::Static::Fundamental::MetaClass::UsingOneYaml

  include ::TokyoMetro::ClassNameLibrary::Static::TrainOperationStatus

  # @!group 列車運行情報のリスト

  # 定数を設定するクラスメソッド
  # @return [nil]
  def self.set_constant
    ::TokyoMetro::Static.const_set( :TRAIN_OPERATION_STATUSES , self.generate_from_yaml )
  end

  # @!endgroup

end
