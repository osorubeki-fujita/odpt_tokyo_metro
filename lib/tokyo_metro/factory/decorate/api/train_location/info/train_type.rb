class TokyoMetro::Factory::Decorate::Api::TrainLocation::Info::TrainType

  def initialize( obj )
    @obj = obj
  end

  attr_reader :obj

  def object
    @obj
  end

  def in_db
    #-------- 【千代田線】（小田急ロマンスカー）
    if object.romance_car_on_chiyoda_line?
      return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.Chiyoda.RomanceCar.Normal" )

    #-------- 【有楽町線・副都心線】小竹向原

    elsif object.on_yurakucho_or_fukutoshin_line? and object.at_kotake_mukaihara? and object.terminating_on_seibu_line?

      #-------- 西武池袋線（など）

      if object.local_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToSeibu" )
      elsif object.semi_express_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.SemiExpress.ToSeibu" )
      elsif object.rapid_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Rapid.ToSeibu" )
      elsif object.rapid_express_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.RapidExpress.ToSeibu" )
      end

    #-------- 【有楽町線・副都心線】和光市

    elsif object.on_yurakucho_or_fukutoshin_line? and object.at_wakoshi? and object.terminating_on_tobu_tojo_line?

      #-------- 東武東上線

      if object.local_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.Local.ToTobuTojo" )
      end

    #-------- 【副都心線】渋谷

    elsif object.on_fukutoshin_line? and object.at_shibuya_on_fukutoshin_line? and object.terminating_on_tokyu_toyoko_or_minatomirai_line?

      #-------- 東急東横線・みなとみらい線

      if object.commuter_limited_express_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.CommuterLimitedExpress.ToTokyu" )
      elsif object.limited_express_train?
        return ::TrainType.find_by( same_as: "custom.TrainType:TokyoMetro.YurakuchoFukutoshin.LimitedExpress.ToTokyu" )
      end

    end

    t = ::TrainType.find_by( train_type_in_api_id: train_type_in_api_id , railway_line_id: railway_line_id )
    if t.present?
      return t
    end

    raise "Error: train_type_in_api: \"#{ object.train_type }\" / railway_line: \"#{ object.railway_line }\""
  end

  def self.get( object )
    self.new( object ).in_db
  end

end
