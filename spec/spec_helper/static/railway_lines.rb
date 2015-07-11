def static_railway_lines
  columns_for_check_css_class = [ :same_as , :css_class ]

  railway_line_and_css_class = [
    ["odpt.Railway:TokyoMetro.Ginza", "ginza"],
    ["odpt.Railway:TokyoMetro.Marunouchi", "marunouchi"],
    ["odpt.Railway:TokyoMetro.MarunouchiBranch", "marunouchi_branch"],
    ["odpt.Railway:TokyoMetro.Hibiya", "hibiya"],
    ["odpt.Railway:TokyoMetro.Tozai", "tozai"],
    ["odpt.Railway:TokyoMetro.Chiyoda", "chiyoda"],
    ["odpt.Railway:TokyoMetro.ChiyodaBranch", "chiyoda_branch"],
    ["odpt.Railway:TokyoMetro.Yurakucho", "yurakucho"],
    ["odpt.Railway:TokyoMetro.Hanzomon", "hanzomon"],
    ["odpt.Railway:TokyoMetro.Namboku", "namboku"],
    ["odpt.Railway:TokyoMetro.Fukutoshin", "fukutoshin"],
    ["odpt.Railway:Toei.Asakusa", "toei_asakusa"],
    ["odpt.Railway:Toei.Mita", "toei_mita"],
    ["odpt.Railway:Toei.Shinjuku", "toei_shinjuku"],
    ["odpt.Railway:Toei.Oedo", "toei_oedo"],
    ["odpt.Railway:Toei.NipporiToneri", "nippori_toneri"],
    ["odpt.Railway:Toei.TodenArakawa", "toden_arakawa"],
    ["odpt.Railway:JR-East", "jrs"],
    ["odpt.Railway:JR-East.Yamanote", "jr_yamanote"],
    ["odpt.Railway:JR-East.KeihinTohoku", "jr_keihin_tohoku"],
    ["odpt.Railway:JR-East.Tokaido", "jr_tokaido"],
    ["odpt.Railway:JR-East.Yokosuka", "jr_yokosuka"],
    ["odpt.Railway:JR-East.Takasaki", "jr_takasaki"],
    ["odpt.Railway:JR-East.Utsunomiya", "jr_utsunomiya"],
    ["odpt.Railway:JR-East.ShonanShinjuku", "jr_shonan_shinjuku"],
    ["odpt.Railway:JR-East.UenoTokyo", "jr_ueno_tokyo"],
    ["odpt.Railway:JR-East.Chuo", "jr_chuo_limited_exp"],
    ["odpt.Railway:JR-East.ChuoKaisoku", "jr_chuo_rapid"],
    ["odpt.Railway:JR-East.ChuoSobu", "jr_chuo_and_sobu_local"],
    ["odpt.Railway:JR-East.ChuoTozai", "jr_chuo_and_sobu_local_between_nakano_and_mitaka"],
    ["odpt.Railway:JR-East.SobuTozai", "jr_chuo_and_sobu_local_between_nishi_funabashi_and_tsudanuma"],
    ["odpt.Railway:JR-East.Sobu", "jr_sobu_rapid"],
    ["odpt.Railway:JR-East.NaritaExpress", "jr_narita_exp"],
    ["odpt.Railway:JR-East.Saikyo", "jr_saikyo"],
    ["odpt.Railway:JR-East.Joban", "jr_joban"],
    ["odpt.Railway:JR-East.Keiyo", "jr_keiyo"],
    ["odpt.Railway:JR-East.Musashino", "jr_musashino"],
    ["odpt.Railway:JR-East.Shinkansen", "shinkansen_e"],
    ["odpt.Railway:JR-Central.Shinkansen", "shinkansen_c"],
    ["odpt.Railway:Tokyu.Toyoko", "tokyu_toyoko"],
    ["odpt.Railway:Tokyu.Meguro", "tokyu_meguro"],
    ["odpt.Railway:Tokyu.DenEnToshi", "tokyu_den_en_toshi"],
    ["odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai", "yokohama_minatomirai_mm"],
    ["odpt.Railway:Odakyu.Odawara", "odakyu_odawara"],
    ["odpt.Railway:Odakyu.Tama", "odakyu_tama"],
    ["odpt.Railway:Odakyu.Enoshima", "odakyu_enoshima"],
    ["odpt.Railway:HakoneTozan.Rail.OdawaraSide", "hakone_tozan"],
    ["odpt.Railway:HakoneTozan.Rail.GoraSide", "hakone_tozan"],
    ["odpt.Railway:Seibu.Ikebukuro", "seibu_ikebukuro"],
    ["odpt.Railway:Seibu.SeibuChichibu", "seibu_chichibu"],
    ["odpt.Railway:Seibu.Toshima", "seibu_toshima"],
    ["odpt.Railway:Seibu.Sayama", "seibu_sayama"],
    ["odpt.Railway:Seibu.SeibuYurakucho", "seibu_yurakucho"],
    ["odpt.Railway:Seibu.Shinjuku", "seibu_shinjuku"],
    ["odpt.Railway:Tobu.SkyTreeIsesaki", "tobu_sky_tree_and_isesaki"],
    ["odpt.Railway:Tobu.SkyTreeOshiage", "tobu_sky_tree_oshiage_hikifune"],
    ["odpt.Railway:Tobu.SkyTree", "tobu_sky_tree"],
    ["odpt.Railway:Tobu.Isesaki", "tobu_isesaki"],
    ["odpt.Railway:Tobu.Nikko", "tobu_nikko"],
    ["odpt.Railway:Tobu.Kinugawa", "tobu_kinugawa"],
    ["odpt.Railway:Tobu.Tojo", "tobu_tojo"],
    ["odpt.Railway:SaitamaRailway.SaitamaRailway", "saitama"],
    ["odpt.Railway:ToyoRapidRailway.ToyoRapidRailway", "toyo_rapid"],
    ["odpt.Railway:Keio.Keio", "keio_line"],
    ["odpt.Railway:Keio.New", "keio_new"],
    ["odpt.Railway:Keio.Inokashira", "keio_inokashira"],
    ["odpt.Railway:Keisei.KeiseiMain", "keisei_main"],
    ["odpt.Railway:Keisei.KeiseiOshiage", "keisei_oshiage"],
    ["odpt.Railway:MIR.TX", "tsukuba_exp"],
    ["odpt.Railway:Yurikamome.Yurikamome", "yurikamome_line"],
    ["odpt.Railway:TWR.Rinkai", "rinkai"],
    ["odpt.Railway:Undefined", "undefined"],
    ["odpt.Railway:JR-East.Shinkansen.2015", "shinkansen_e"],
    ["odpt.Railway:JR-East.Shinkansen.2016", "shinkansen_e"]
  ]

  ::TokyoMetro::Static.railway_lines.each do | railway_line_name , info |

    describe ::TokyoMetro::Static::RailwayLine::Info do
      it "\'#{ railway_line_name }\' has attiribute \'same_as\' (String)" do
        expect( info.same_as ).to be_instance_of( ::String )
      end
      it "\'#{ railway_line_name }\' has attiribute \'name_ja\' (Array)" do
        expect( info.name_ja ).to be_instance_of( ::Array )
      end
      it "\'#{ railway_line_name }\' has attiribute \'name_en\' (Array)" do
        expect( info.name_en ).to be_instance_of( ::Array )
      end
      it "\'#{ railway_line_name }\' has attiribute \'index\' (number)" do
        expect( info.index ).to be_number
      end
      it "\'#{ railway_line_name }\' has attiribute \'operator\' (TokyoMetro::Static::Operator::Info)" do
        expect( info.operator ).to be_instance_of( ::TokyoMetro::Static::Operator::Info )
      end

      valid_same_as_and_css_class = railway_line_and_css_class.find { | same_as , css_class | same_as == info.same_as }
      it "has method 'css_class'" do
        expect( valid_same_as_and_css_class ).to be_present
        expect( info.css_class ).to eq( valid_same_as_and_css_class[1] )
      end
    end

    if info.color.present?
      describe ::TokyoMetro::Static::RailwayLine::Info do
        it "\'#{railway_line_name}\' contains color info." do
          expect( info.color ).to be_instance_of( ::Array )
          # expect( info.color ).to be_instance_of( ::TokyoMetro::Static::Color )
        end
      end
    end

  end
end

__END__


  describe ::TokyoMetro::Static::Operator::Info do
    ::TokyoMetro::Static.operators.each do | operator , static_info |
      infos = operator_infos_in_db.find { | item | item[0] == operator }
      it "has valid infos" do
        for i in 1..( columns.length - 1 )
          s = static_info.send( columns[i] )
          in_db = infos[i]
          if in_db.blank?
            expect(s).to be_blank
          else
            expect(s).to eq( in_db )
          end
        end
      end
    end
  end
