class TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::MarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_convert?
      @object.instance_variable_set( :@railway_line , ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_branch_same_as )
    end
  end

  private

  # @note @railway_line は、方南町、中野富士見町、中野新橋、中野坂上を "odpt.Railway:TokyoMetro.MarunouchiBranch" で統一する。
  def to_convert?
    @object.same_as?( /\Aodpt\.StationTimetable\:TokyoMetro\.MarunouchiBranch/ )
  end

end
