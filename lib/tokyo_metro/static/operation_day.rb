class TokyoMetro::Static::OperationDay < TokyoMetro::Static::Fundamental::MetaClass::UsingOneYaml

  include ::TokyoMetro::ClassNameLibrary::Static::OperationDay

  # @!group 運行日のリスト

  # 定数を設定するクラスメソッド
  # @return [nil]
  def self.set_constant
    ::TokyoMetro::Static.const_set( :OPERATION_DAYS , self.generate_from_yaml )
  end

  # @!endgroup

  def self.of_current
    as_of( ::TokyoMetro.time_now )
  end

  def self.as_of( time )
    if time.hour < ::TokyoMetro::DATE_CHANGING_HOUR
      t = time.yesterday
    else
      t = time
    end
    ::DateTime.new( t.year , t.month , t.day , 12 , 0 , 0 , t.zone )
  end

end
