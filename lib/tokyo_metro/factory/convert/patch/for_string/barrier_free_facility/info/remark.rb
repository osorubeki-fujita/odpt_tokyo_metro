module TokyoMetro::Factory::Convert::Patch::ForString::BarrierFreeFacility::Info::Remark

  def process
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
    str = str.gsub( "時間制限" , "利用可能時間" )
    str
  end

end