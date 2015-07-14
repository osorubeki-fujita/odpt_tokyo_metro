# 複数の鉄道事業者の情報を扱うクラス（ハッシュ）
class TokyoMetro::Static::Operator::Hash < ::TokyoMetro::Static::Fundamental::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::Operator
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Hash

  # テスト用メソッド
  # @param title [Strng] 表示するタイトル（設定しない場合は、ハッシュの上位の名前空間の名称）
  # @return [nil]
  def define_test( title = self.class.upper_namespace.name )
    super( title )
    puts ""
    puts "○ CSS class name"
    puts self.values.map( &:css_class )

    return nil
  end

end
