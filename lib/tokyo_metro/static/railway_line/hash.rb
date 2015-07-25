# 複数の路線の情報を扱うクラス（ハッシュ）
class TokyoMetro::Static::RailwayLine::Hash < ::TokyoMetro::Static::Fundamental::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Hash

  # 与えられた路線名の文字列から色を取得するメソッド
  # @param str [String] 路線名の文字列
  # @return [::TokyoMetro::Static::Color]
  def select_main_color( str )
    if self.keys.include?( str )
      return self[ str ].colors.first
    else
      #---- 末尾が数字の場合 ここから
      if /\A(odpt\.Railway\:[a-zA-Z\-\.]+)\.(\d+?)\Z/ =~ str
        str , num = $1 , $2.to_i
        # 文字列部分が self の key である場合
        if self.keys.include?( str )
          color_infos = self[ str ].colors
          if color_infos.instance_of?( ::Array ) and num <= color_infos.length
            return color_infos[ num - 1 ]
          end
        end
      end
      #---- 末尾が数字の場合 ここまで
    end
    puts self.keys
    puts ""
    raise "Error: \"#{str}\" is not valid."
  end

end
