class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info::TrainType

  def initialize( decorator )
    @decorator = decorator
  end

  attr_reader :decorator

  def object
    @decorator.object
  end

  # @todo 本完了へ
  def in_db
    #-------- 【千代田線】（小田急ロマンスカー）
    if object.romance_car_on_chiyoda_line?
      return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.Normal" )

    #-------- 【有楽町線・副都心線】小竹向原

    elsif object.on_yurakucho_or_fukutoshin_line? and object.at_kotake_mukaihara? and object.terminating_on_seibu_line?

      #-------- 西武池袋線（など）

      if object.local_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToSeibu" )
      elsif object.semi_express_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" )
      elsif object.rapid_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Rapid.ToSeibu" )
      elsif object.rapid_express_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.RapidExpress.ToSeibu" )
      end

    #-------- 【有楽町線・副都心線】和光市

    elsif object.on_yurakucho_or_fukutoshin_line? and object.at_wakoshi? and object.terminating_on_tobu_tojo_line?

      #-------- 東武東上線

      if object.local_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToTobuTojo" )
      end

    #-------- 【副都心線】渋谷

    elsif object.on_fukutoshin_line? and object.at_shibuya_on_fukutoshin_line? and object.terminating_on_tokyu_toyoko_or_minatomirai_line?

      #-------- 東急東横線・みなとみらい線

      if object.commuter_limited_express_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToTokyu" )
      elsif object.limited_express_train?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.LimitedExpress.ToTokyu" )
      end

    #-------- 【南北線・三田線】目黒 - 白金高輪

    elsif object.on_namboku_line? and object.local_train?

      if object.terminate_on_tokyu_meguro_line?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.Namboku.Local.ToTokyu" )
      else
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:TokyoMetro.Namboku.Local.Normal" )
      end

    elsif object.on_toei_mita_line? and object.local_train?

      if object.terminate_on_tokyu_meguro_line?
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:Toei.Mita.Local.ToTokyu" )
      else
        return ::TrainType::Info.find_by( same_as: "custom.TrainType:Toei.Mita.Local.Normal" )
      end

    end

    t = ::TrainType::Info.find_by( in_api_id: in_api_id , railway_line_id: railway_line_id )
    if t.present?
      return t
    end

    raise "Error: train_type_in_api: \"#{ object.train_type }\" / railway_line: \"#{ object.railway_line }\""
  end

  def self.get( decorator )
    self.new( decorator ).in_db
  end

  private

  def railway_line_in_db
    ::RailwayLine.find_by( same_as: object.railway_line )
  end

  def railway_line_id
    railway_line_in_db.id
  end

  def train_type_in_api
    ::TrainType::InApi.find_by( same_as: object.train_type )
  end

  def in_api_id
    train_type_in_api.id
  end

end
