def static_train_types

  train_types_and_color_basenames = [["custom.TrainType:TokyoMetro.Ginza.Local.Normal", "train_type_ginza_local_normal"],
    ["custom.TrainType:TokyoMetro.Marunouchi.Local.Normal", "train_type_marunouchi_local_normal"],
    ["custom.TrainType:TokyoMetro.MarunouchiBranch.Local.Normal", "train_type_marunouchi_branch_local_normal"],
    ["custom.TrainType:TokyoMetro.Hibiya.Local.Normal", "train_type_hibiya_local_normal"],
    ["custom.TrainType:TokyoMetro.Tozai.Local.Normal", "train_type_tozai_local_normal"],
    ["custom.TrainType:TokyoMetro.Tozai.Local.ForMitaka", "train_type_tozai_local_for_mitaka"],
    ["custom.TrainType:TokyoMetro.Tozai.Local.ForTsudanuma", "train_type_tozai_local_for_tsudanuma"],
    ["custom.TrainType:TokyoMetro.Tozai.Local.ForToyoRapidRailway", "train_type_tozai_local_for_toyo_rapid_railway"],
    ["custom.TrainType:TokyoMetro.Tozai.CommuterRapid.Normal", "train_type_tozai_commuter_rapid_normal"],
    ["custom.TrainType:TokyoMetro.Tozai.CommuterRapid.ForMitaka", "train_type_tozai_commuter_rapid_for_mitaka"],
    ["custom.TrainType:TokyoMetro.Tozai.Rapid.Normal", "train_type_tozai_rapid_normal"],
    ["custom.TrainType:TokyoMetro.Tozai.Rapid.ForMitaka", "train_type_tozai_rapid_for_mitaka"],
    ["custom.TrainType:TokyoMetro.Tozai.Rapid.ForTsudanuma", "train_type_tozai_rapid_for_tsudanuma"],
    ["custom.TrainType:TokyoMetro.Tozai.Rapid.ForToyoRapidRailway", "train_type_tozai_rapid_for_toyo_rapid_railway"],
    ["custom.TrainType:TokyoMetro.Tozai.ToyoRapid.ForToyoRapidRailway", "train_type_tozai_toyo_rapid_for_toyo_rapid_railway"],
    ["custom.TrainType:TokyoMetro.Chiyoda.Local.Normal", "train_type_chiyoda_local_normal"],
    ["custom.TrainType:TokyoMetro.ChiyodaBranch.Local.Normal", "train_type_chiyoda_branch_local_normal"],
    ["custom.TrainType:TokyoMetro.Chiyoda.Local.ForJR", "train_type_chiyoda_local_for_jr"],
    ["custom.TrainType:TokyoMetro.Chiyoda.Local.ForOdakyu", "train_type_chiyoda_local_for_odakyu"],
    ["custom.TrainType:TokyoMetro.Chiyoda.SemiExpress.ForOdakyu", "train_type_chiyoda_semi_express_for_odakyu"],
    ["custom.TrainType:TokyoMetro.Chiyoda.TamaExpress.ForOdakyu", "train_type_chiyoda_tama_express_for_odakyu"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.Normal", "train_type_chiyoda_romance_car_normal"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.Weekdays.21", "train_type_chiyoda_romance_car_metro_hakone_weekdays_21"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.71", "train_type_chiyoda_romance_car_metro_home_way_weekdays_71"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.41", "train_type_chiyoda_romance_car_metro_home_way_weekdays_41"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.Weekdays.43", "train_type_chiyoda_romance_car_metro_home_way_weekdays_43"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.21", "train_type_chiyoda_romance_car_metro_hakone_saturdays_holidays_21"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.23", "train_type_chiyoda_romance_car_metro_hakone_saturdays_holidays_23"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHomeWay.SaturdaysHolidays.43", "train_type_chiyoda_romance_car_metro_home_way_saturdays_holidays_43"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroSagami.Weekdays.70", "train_type_chiyoda_romance_car_metro_sagami_weekdays_70"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.Weekdays.22", "train_type_chiyoda_romance_car_metro_hakone_weekdays_22"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroSagami.SaturdaysHolidays.80", "train_type_chiyoda_romance_car_metro_sagami_saturdays_holidays_80"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.22", "train_type_chiyoda_romance_car_metro_hakone_saturdays_holidays_22"],
    ["custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.MetroHakone.SaturdaysHolidays.24", "train_type_chiyoda_romance_car_metro_hakone_saturdays_holidays_24"],
    ["custom.TrainType:TokyoMetro.Hanzomon.Local.Normal", "train_type_hanzomon_local_normal"],
    ["custom.TrainType:TokyoMetro.Hanzomon.Local.ToTokyu", "train_type_hanzomon_local_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Hanzomon.SemiExpress.ToTokyu", "train_type_hanzomon_semi_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Hanzomon.HolidayExpress.ToTokyu", "train_type_hanzomon_holiday_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Hanzomon.Express.ToTokyu", "train_type_hanzomon_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Hanzomon.SemiExpress.ToTobu", "train_type_hanzomon_semi_express_to_tobu"],
    ["custom.TrainType:TokyoMetro.Hanzomon.Express.ToTobu", "train_type_hanzomon_express_to_tobu"],
    ["custom.TrainType:TokyoMetro.Namboku.Local.Normal", "train_type_namboku_local_normal"],
    ["custom.TrainType:TokyoMetro.Namboku.Local.ToTokyu", "train_type_namboku_local_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Namboku.Express.ToTokyu", "train_type_namboku_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.Yurakucho.Local.Colored", "train_type_yurakucho_local_colored"],
    ["custom.TrainType:TokyoMetro.Fukutoshin.Local.Colored", "train_type_fukutoshin_local_colored"],
    ["custom.TrainType:TokyoMetro.Yurakucho.Local.Normal", "train_type_yurakucho_local_normal"],
    ["custom.TrainType:TokyoMetro.Fukutoshin.Local.Normal", "train_type_fukutoshin_local_normal"],
    ["custom.TrainType:TokyoMetro.Fukutoshin.CommuterExpress.Normal", "train_type_fukutoshin_commuter_express_normal"],
    ["custom.TrainType:TokyoMetro.Fukutoshin.HolidayExpress.Normal", "train_type_fukutoshin_holiday_express_normal"],
    ["custom.TrainType:TokyoMetro.Fukutoshin.Express.Normal", "train_type_fukutoshin_express_normal"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToSeibu", "train_type_yurakucho_fukutoshin_local_to_seibu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu", "train_type_yurakucho_fukutoshin_semi_express_to_seibu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Rapid.ToSeibu", "train_type_yurakucho_fukutoshin_rapid_to_seibu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.RapidExpress.ToSeibu", "train_type_yurakucho_fukutoshin_rapid_express_to_seibu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToTobuTojo", "train_type_yurakucho_fukutoshin_local_to_tobu_tojo"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToTokyu", "train_type_yurakucho_fukutoshin_local_to_tokyu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Express.ToTokyu", "train_type_yurakucho_fukutoshin_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToTokyu", "train_type_yurakucho_fukutoshin_commuter_limited_express_to_tokyu"],
    ["custom.TrainType:TokyoMetro.YurakuchoFukutoshin.LimitedExpress.ToTokyu", "train_type_yurakucho_fukutoshin_limited_express_to_tokyu"],
    ["custom.TrainType:Toei.Asakusa.Local.Normal", "train_type_toei_asakusa_local_normal"],
    ["custom.TrainType:Toei.Asakusa.AirportLimitedExpress.Normal", "train_type_toei_asakusa_airport_limited_express_normal"],
    ["custom.TrainType:Toei.Mita.Local.Normal", "train_type_toei_mita_local_normal"],
    ["custom.TrainType:Toei.Mita.Local.ToTokyu", "train_type_toei_mita_local_to_tokyu"],
    ["custom.TrainType:Toei.Mita.Express.ToTokyu", "train_type_toei_mita_express_to_tokyu"],
    ["custom.TrainType:Toei.Shinjuku.Local.Normal", "train_type_toei_shinjuku_local_normal"],
    ["custom.TrainType:Toei.Shinjuku.Express.Normal", "train_type_toei_shinjuku_express_normal"],
    ["custom.TrainType:Toei.Oedo.Local.Normal", "train_type_toei_oedo_local_normal"],
    ["custom.TrainType:Undefined", "train_type_undefined"]
  ]

  train_types_in_api_and_their_infos = [
    ["odpt.TrainType:TokyoMetro.Local", "各停", nil, "各停", "Local", nil, "Local"],
    ["odpt.TrainType:TokyoMetro.LimitedExpress", "特急", nil, "特急", "Limited Express", nil, "Limited Express"],
    ["odpt.TrainType:TokyoMetro.Express", "急行", nil, "急行", "Express", nil, "Express"],
    ["odpt.TrainType:TokyoMetro.HolidayExpress", "土休急行", "急行", "急行", "Express (Holiday)", "Express", "Express"],
    ["odpt.TrainType:TokyoMetro.SemiExpress", "準急", nil, "準急", "Semi Express", nil, "Semi Express"],
    ["odpt.TrainType:TokyoMetro.Rapid", "快速", nil, "快速", "Rapid", nil, "Rapid"],
    ["odpt.TrainType:TokyoMetro.CommuterRapid", "通勤快速", nil, "通勤快速", "Commuter Rapid", nil, "Commuter Rapid"],
    ["odpt.TrainType:TokyoMetro.ToyoRapid", "東葉快速", nil, "東葉快速", "Toyo Rapid", nil, "Toyo Rapid"],
    ["odpt.TrainType:TokyoMetro.TamaExpress", "多摩急行", nil, "多摩急行", "Tama Express", nil, "Tama Express"],
    [
      "odpt.TrainType:TokyoMetro.RomanceCar","特急ロマンスカー","特急","特急",
      "Limited Express \"Romance Car\"", nil , "Limited Express \"Romance Car\""
    ],
    ["odpt.TrainType:TokyoMetro.RapidExpress", "快速急行", nil, "快速急行", "Rapid Express", nil, "Rapid Express"],
    ["odpt.TrainType:TokyoMetro.CommuterLimitedExpress", "通勤特急", nil, "通勤特急", "Commuter Ltd. Exp.", nil, "Commuter Ltd. Exp."],
    ["odpt.TrainType:TokyoMetro.CommuterExpress", "通勤急行", nil, "通勤急行", "Commuter Express", nil, "Commuter Express"],
    ["odpt.TrainType:TokyoMetro.CommuterSemiExpress", "通勤準急", nil, "通勤準急", "Commuter Semi Express", nil, "Commuter Semi Express"],
    ["odpt.TrainType:TokyoMetro.Unknown", "不明", nil, "不明", "Unknown", nil, "Unknown"],
    ["odpt.TrainType:TokyoMetro.Extra", "臨時", nil, "臨時", "Extra", nil, "Extra"],
    ["odpt.TrainType:Toei.AirportLimitedExpress", "エアポート快特", nil, "エアポート快特", "Airport Limited Express", nil, "Airport Limited Express"],
    ["odpt.TrainType:Toei.Local", "各停", nil, "各停", "Local", nil, "Local"],
    ["odpt.TrainType:Toei.Express", "急行", nil, "急行", "Express", nil, "Express"]
 ]


  [ ::TokyoMetro::Static.train_types , ::TokyoMetro::Static.train_types_other_operator ].each do |h|
    h.each do | train_type_name , info |

      describe ::TokyoMetro::Static::TrainType::Custom::Main::Info do
        it "\'#{ train_type_name }) contains color info" do
          expect( info.color ).not_to be_instance_of( ::Array )
          expect( ( info.color.instance_of?( ::TokyoMetro::Static::Color ) or info.color.instance_of?( ::TokyoMetro::Static::TrainType::Color::Info ) ) ).to be_truthy
        end

        it "\'#{train_type_name}\' contains bgcolor info." do
          expect( info.bgcolor ).not_to be_instance_of( ::Array )
          expect( ( info.bgcolor.instance_of?( ::TokyoMetro::Static::Color ) or info.bgcolor.instance_of?( ::TokyoMetro::Static::TrainType::Color::Info ) ) ).to be_truthy
        end

      end

    end
  end

  describe ::TokyoMetro::Static::TrainType::Custom::Main::Info , 'color_basename' do
    ::TokyoMetro::Static.train_types.each do | train_type_name , info |
      same_as , valid_color_basename = train_types_and_color_basenames.find { | same_as , color_basename | same_as == train_type_name }
      it "has method 'color_basename'" do
        # puts info.color_basename
        # puts valid_color_basename
        expect( info.color_basename ).to eq( valid_color_basename )
      end
    end
  end

  describe ::TokyoMetro::Static::TrainType::InApi::Info do
    ::TokyoMetro::Static.train_types_in_api.each do | train_type_name_in_api , info |
      infos = train_types_in_api_and_their_infos.find { | item | item[0] == train_type_name_in_api }
      same_as , name_ja , name_ja_short , name_ja_normal , name_en , name_en_short , name_en_normal = infos
      it "has valid infos" do
        expect( info.name_ja ).to eq( name_ja )
        expect( info.name_ja_short ).to eq( name_ja_short )
        expect( info.name_ja_normal ).to eq( name_ja_normal )
        expect( info.name_en ).to eq( name_en )
        expect( info.name_en_short ).to eq( name_en_short )
        expect( info.name_en_normal ).to eq( name_en_normal )
      end
    end
  end

end
