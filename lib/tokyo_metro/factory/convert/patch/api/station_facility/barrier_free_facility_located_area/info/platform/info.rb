class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::Info::Platform::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_process?
      process_invalid_barrier_free_facilitiy_names
    end
  end

  private

  def to_process?
    has_infos_of_barrier_free_facilities? and has_info_of_invalid_barrier_free_facility?
  end

  def has_infos_of_barrier_free_facilities?
    @object.barrier_free_facilities.present?
  end

  def has_info_of_invalid_barrier_free_facility?
    @object.barrier_free_facilities.any?{ | item | item.facility == ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::INVALID_TOILET_NAME }
  end

  def process_invalid_barrier_free_facilitiy_names
    ary = ::Array.new
    @object.barrier_free_facilities.each do | item |

      if item.facility == ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::INVALID_TOILET_NAME
        item.instance_eval do
          @facility = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::BarrierFreeFacilityLocatedAreaAtNakanoShimbashi::VALID_TOILET_NAME
        end
      end

    end
  end

end
