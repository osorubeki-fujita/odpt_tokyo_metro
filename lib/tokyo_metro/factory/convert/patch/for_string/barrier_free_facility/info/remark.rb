module TokyoMetro::Factory::Convert::Patch::ForString::BarrierFreeFacility::Info::Remark

  def process
    available = "利用時間"
    # available = "利用可能時間"

    str = self.zen_num_to_han
    str = str.gsub( /。([\(（].+?[\)）])/ ) { "#{$1}。" }
    str = str.gsub( /(?<=。)\n?[ 　]?/ , "\n" )
    str = str.gsub( "出きません" , "できません" )
    str = str.gsub( "ＪＲ" , "JR" )
    str = str.gsub( /(?<=または) (?=\d番)/ , "" )
    str = str.gsub( /、?(?:および|及び)、?/ , "、" )
    str = str.gsub( /ご?利用/ , "ご利用" )
    str = str.gsub( /お?乗り?換え?/ , "お乗り換え" )
    str = str.gsub( /(?<=（時間制限)：?(?=\d{1,2}時～\d{1,2}時）)/ , "：" )
    str = str.gsub( "時間制限" , available )
    str = str.gsub( /お[こ越]し(?:いただ|頂)/ , "お越しいただ" )
    str = str.gsub( /(?<=ますが)、?(?=#{ available })/ , "、" )
    str = str.gsub( /(?<=が、#{ available })(?=があります)/ , "に制限" )
    str = str.gsub( /(?<=ご利用、お乗り換えは)、?(?=できません。)/ , "" )

    str = str.gsub( "B8出入口エレベーターB7出入口エレベーター" , "B8出入口エレベーター、B7出入口エレベーター" )

    str = str.gsub( /(#{ available }に制限があります。)\n?((?:[A-Z]?(?:\d{1,2})?[a-z]?出入口（\d{1,2}時～\d{1,2}時）)+)/ ) {
      str_ary = ::Array.new
      str_ary << $1
      service_times = $2.split( /(?<=時）)/ ).map { | s |
        s.gsub( /\A([A-Z]?(?:\d{1,2})?[a-z]?出入口)（(\d{1,2}時～\d{1,2}時)）\Z/ ) { "#{ $1 }：#{ $2 }" }
      }
      str_ary << service_times
      str_ary.flatten.join( "\n" ) + "\n"
    }


    str = str.gsub( /が、?利用時間（(.+)）があります。/ ) { "。ご利用できる時間帯は #{ $1 } です。" }

    # 御茶ノ水
    str = str.gsub( /(?<=利用時間に制限があります)（6時～終車（1F）6時～20時（2F））、/ , "（1F：6時～終車、2F：6時～20時）。\n" )
    str = str.gsub( /(?<=神田川)より(?=の)/ , "沿い" )

    str.gsub( /\n\Z/ , "" )
  end

end
