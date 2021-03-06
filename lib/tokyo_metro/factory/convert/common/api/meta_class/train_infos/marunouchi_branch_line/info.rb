class TokyoMetro::Factory::Convert::Common::Api::MetaClass::TrainInfos::MarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_process?
      convert_railway_line_name
    end
  end

  private

  def to_process?
    @object.operated_only_on_marunouchi_branch_line_including_invalid?
  end

  def convert_railway_line_name
    @object.instance_variable_set( :@railway_line , ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_branch_same_as  )
  end

end
