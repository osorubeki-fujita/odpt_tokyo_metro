class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::PlatformTransferInfoAtKudanshita::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  SAME_AS = "odpt.StationFacility:TokyoMetro.Kudanshita"
  RAILWAY_LINE = "odpt.Railway:Toei.Shinjuku"

  INVALID_DIRECTION = RAILWAY_LINE
  VALID_DIRECTION = "odpt.RailDirection:Toei.Shinjuku"

  def process
    if to_process?
      convert_platform_transfer_infos_at_kudanshita
    end
  end

  private

  def to_process?
    @object.same_as == SAME_AS
  end

  def convert_platform_transfer_infos_at_kudanshita
    @object.platform_infos.each do | platform_info |
      if platform_info.transfer_infos.present?

        platform_info.transfer_infos.each do | transfer_info |
          ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
            transfer_info ,
            railway_line: RAILWAY_LINE ,
            railway_direction: { from: INVALID_DIRECTION , to: VALID_DIRECTION }
          )
        end

      end
    end
  end

end
