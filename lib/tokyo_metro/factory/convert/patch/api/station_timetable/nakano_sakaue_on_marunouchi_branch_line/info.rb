class TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::NakanoSakaueOnMarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  INVALID_NAME = "odpt.StationTimetable:TokyoMetro.Marunouchi.NakanoSakaue.Honancho"
  VALID_NAME = "odpt.StationTimetable:TokyoMetro.MarunouchiBranch.NakanoSakaue.Honancho"

  # 「丸ノ内支線 中野坂上駅からの方南町方面の時刻表」に関する処理
  # @return [nil]
  # @note 誤：
  #   @same_as == "odpt.StationTimetable:TokyoMetro.Marunouchi.NakanoSakaue.Honancho" - 「丸ノ内線 中野坂上駅からの方南町方面の時刻表」
  # @note 正：
  #   @same_as == "odpt.StationTimetable:TokyoMetro.MarunouchiBranch.NakanoSakaue.Honancho" - 「丸ノ内支線 中野坂上駅からの方南町方面の時刻表」
  def process
    if to_process?
      @object.instance_variable_set( :@same_as , VALID_NAME )
    end
  end

  private

  def to_process?
    @object.at_nakano_sakaue? and @object.same_as?( INVALID_NAME )
  end

end
