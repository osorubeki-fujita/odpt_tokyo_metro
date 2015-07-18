class TokyoMetro::Required::All::Modules < TokyoMetro::Required

  # modules
  #-------- common / 様々なクラスに組み込むモジュール
  #-------- api / API を扱うクラスに組み込むモジュール
  #-------- static / 変化のない（or 非常に少ない）情報を扱うクラスに組み込むモジュール
  #-------- db
  def self.other_files
    [
      Dictionary.files ,
      Decision.files ,
      ToFactory.files ,
      #
      Fundamental.files
    ]
  end

end
