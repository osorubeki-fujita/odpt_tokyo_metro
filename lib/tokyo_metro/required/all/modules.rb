class TokyoMetro::Required::All::Modules < TokyoMetro::Required

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "modules" )
  end

  #---------------- modules
  #------------------------ common / 様々なクラスに組み込むモジュール
  #------------------------ api / API を扱うクラスに組み込むモジュール
  #------------------------ static / 変化のない（or 非常に少ない）情報を扱うクラスに組み込むモジュール
  #------------------------ db
  def self.other_files
    [
      Dir.glob( "#{ top_file }/**.rb" ) ,
      Common.files ,
      Api.files
    ]
  end

end