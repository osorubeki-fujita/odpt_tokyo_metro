class TokyoMetro::Factory::Convert::Customize::Api::StationFacility::ChiyodaBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def initialize( object )
    super( object )
    @hash_for_converting_railway_line = {
      from: ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_same_as ,
      to: ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.chiyoda_branch_same_as
    }
  end

  def process
    case @object.same_as
    when "odpt.StationFacility:TokyoMetro.Ayase"
      convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
      convert_railway_line_name_of_transfer_infos_to_chiyoda_branch_line

    when "odpt.StationFacility:TokyoMetro.KitaAyase"
      convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
    end
  end

  private

  def convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
    @object.platform_infos.each do | info |
      ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform.process(
        info ,
        car_composition: 3 ,
        railway_line: @hash_for_converting_railway_line
      )
    end
  end

  def convert_railway_line_name_of_transfer_infos_to_chiyoda_branch_line
    @object.platform_infos.each do | platform_info |
      if platform_info.transfer_infos.present?
        platform_info.transfer_infos.each do | transfer_info |
          ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
            transfer_info ,
            railway_line: @hash_for_converting_railway_line ,
            railway_direction: "odpt.RailDirection:TokyoMetro.KitaAyase"
          )
        end
      end
    end
  end

end
