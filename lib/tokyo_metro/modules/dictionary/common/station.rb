module TokyoMetro::Modules::Dictionary::Common::Station

  include ::TokyoMetro::Modules::Fundamental::ConvertConstantToClassMethod

  STATION_NAME_SAME_AS_IN_DB = ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/station/same_as_in_db.yaml" )

  # @param title
  # @note 変数 title は現在不使用だが、とりあえず残しておく
  # @example
  #   (1) 三鷹
  #     Before: "odpt.Station:JR-East.Chuo.Mitaka"
  #     After: "odpt.Station:JR-East.ChuoTozai.Mitaka"
  #   (2) 津田沼
  #     Before: "odpt.Station:JR-East.ChuoChikatetsuTozai.Tsudanuma"
  #     After: "odpt.Station:JR-East.SobuTozai.Tsudanuma"
  #   (3) 箱根湯本
  #     Before: "odpt.Station:Odakyu.Odawara.HakoneYumoto"
  #     After: "odpt.Station:HakoneTozan.Rail.HakoneYumoto"
  #   (4) 竹ノ塚
  #     Before: "odpt.Station:Tobu.Isesaki.Takenotsuka"
  #     After: "odpt.Station:Tobu.SkyTree.Takenotsuka"
  #   (5) 北越谷
  #     Before: "odpt.Station:Tobu.Isesaki.KitaKoshigaya"
  #     After: "odpt.Station:Tobu.SkyTree.KitaKoshigaya"
  #   (6) 北春日部
  #     Before: "odpt.Station:Tobu.Isesaki.KitaKasukabe"
  #     After: "odpt.Station:Tobu.SkyTree.KitaKasukabe"
  #   (7) 東武動物公園
  #     Before: "odpt.Station:Tobu.Isesaki.TobuDoubutuKouen"
  #     After: "odpt.Station:Tobu.SkyTree.TobuDobutsuKoen"
  #   (8) 元町・中華街
  #     Before: "odpt.Station:Minatomirai.Minatomirai.MotomachiChukagai"
  #     After: "odpt.Station:YokohamaMinatomiraiRailway.Minatomirai.MotomachiChukagai"
  def self.station_same_as_in_db( same_as , title = nil )
    station_alias_from_hash = station_name_same_as_in_db[ same_as ]
    if station_alias_from_hash.present?
      station_alias_from_hash
    else
      same_as
    end
  end

=begin
  class << self

    private

    def set_station_same_as_in_db__raise_error_when_nil( station_same_as , title )
      if station_same_as.nil?
        puts "★ #{ title } of \"#{ @train_number }\" is not defined."
        puts "Please investigate #{ title.downcase } of this train and input."
        station_same_as_new = ::STDIN.gets.chomp
        puts "#{ title } of \"#{ @train_number }\" is"
        puts " " * 4 + station_same_as_new
        puts "OK? \[Y/n\]"
        yn = ::STDIN.gets.chomp
        case yn.downcase
        when "y"
          station_same_as_new
        else
          set_station_same_as_in_db__raise_error_when_nil( station_same_as , title )
        end
      else
        station_same_as
      end
    end

  end
=end

end
