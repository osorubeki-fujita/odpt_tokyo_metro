# Gviz を扱うためのモジュール
module TokyoMetro::Document::Gviz

  def self.set_dir
    # 生成した画像ファイルを保存するディレクトリの名称
    const_set( :DIR , "#{::TokyoMetro::DEV_DIR}/document/gviz" )
  end

end