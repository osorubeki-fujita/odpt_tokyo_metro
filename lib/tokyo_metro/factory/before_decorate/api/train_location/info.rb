class TokyoMetro::Factory::BeforeDecorate::Api::TrainLocation::Info

  def initialize( object )
    @object = object
  end

  attr_reader :object

  def railway_direction_in_api_same_as
    object.railway_direction
  end

  def railway_direction( railway_line_in_db )
    rd = railway_direction_in_api_same_as
    # 都営三田線（目黒 - 白金高輪）の列車
    if railway_line_in_db.namboku_line? and object.toei_mita_line?
      case rd
      when "odpt.RailDirection:Toei.NishiTakashimadaira"
        return "odpt.RailDirection:TokyoMetro.AkabaneIwabuchi"
      when "odpt.RailDirection:Toei.Meguro"
        return "odpt.RailDirection:TokyoMetro.Meguro"
      end
    end

    # 有楽町・副都心線
    if railway_line_in_db.yurakucho_or_fukutoshin_line?

      # 西武線直通列車
      if object.terminating_on_seibu_line?
        case rd
        when "odpt.RailDirection:TokyoMetro.KotakeMukaihara"
          return "odpt.RailDirection:TokyoMetro.Wakoshi"
        end
      end

      # 池袋行き（新木場・渋谷方面から）
      if object.terminating_at_ikebukuro_on_yurakucho_line? or object.terminating_at_ikebukuro_on_fukutoshin_line?
        if object.starting_at_toyosu? or object.starting_at_shin_kiba? or object.starting_at_shibuya_on_fukutoshin_line? or object.starting_on_tokyu_toyoko_or_minatomirai_line?
          return "odpt.RailDirection:TokyoMetro.Wakoshi"
        end
      end

      # 小竹向原行き（新木場・渋谷方面から）
      if object.terminating_at_kotake_mukaihara_on_yurakucho_line? or object.terminating_at_kotake_mukaihara_on_fukutoshin_line?
        if object.starting_at_toyosu? or object.starting_at_shin_kiba? or object.starting_at_shibuya_on_fukutoshin_line? or object.starting_on_tokyu_toyoko_or_minatomirai_line?
          return "odpt.RailDirection:TokyoMetro.Wakoshi"
        end
      end

    end

    # 有楽町線
    if railway_line_in_db.yurakucho_line?

      # 池袋行き（和光市・東武線・西武線方面から）
      if object.terminating_at_ikebukuro_on_yurakucho_line?
        if object.starting_at_wakoshi_on_yurakucho_line? or object.starting_at_kotake_mukaihara_on_yurakucho_line? or object.starting_on_seibu_line? or object.starting_on_tobu_tojo_line?
          return "odpt.RailDirection:TokyoMetro.ShinKiba"
        end
      end

    end

    # 副都心線
    if railway_line_in_db.fukutoshin_line?

      # 新宿三丁目行き（渋谷方面から）
      if object.terminating_at_shinjuku_sanchome_on_fukutoshin_line?
        if object.starting_at_shibuya_on_fukutoshin_line? or object.starting_on_tokyu_toyoko_or_minatomirai_line?
          case rd
          when "odpt.RailDirection:TokyoMetro.Ikebukuro"
            return "odpt.RailDirection:TokyoMetro.Wakoshi"
          end
        end
      end

      # 池袋行き（和光市・東武線・西武線方面から）
      if object.terminating_at_ikebukuro_on_fukutoshin_line?
        if object.starting_at_wakoshi_on_fukutoshin_line? or object.starting_at_kotake_mukaihara_on_fukutoshin_line? or object.starting_on_seibu_line? or object.starting_on_tobu_tojo_line?
          return "odpt.RailDirection:TokyoMetro.Shibuya"
        end
      end

    end

    return rd
  end
  
end
