class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::BarrierFree::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_process?
      convert_invalid_located_area
    end
  end

  private

  def to_process?
    @object.same_as == ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::INVALID_TOILET_NAME
  end

  def convert_invalid_located_area
    if @object.outside?
      @object.instance_variable_set( :@located_area_name , "改札内" )
      @object.instance_variable_set( :@same_as , ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::VALID_TOILET_NAME )
    end
  end

end
