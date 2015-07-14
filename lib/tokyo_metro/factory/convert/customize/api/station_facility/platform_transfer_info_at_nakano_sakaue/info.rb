class TokyoMetro::Factory::Convert::Customize::Api::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_convert?
      convert_railway_line_name_of_platform_infos_to_marunouchi_branch_line
    end

  end

  private

  def convert_railway_line_name_of_platform_infos_to_marunouchi_branch_line
    railway_lines = {
      main: ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_same_as ,
      branch: ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_branch_same_as
    }
    for_honancho = "odpt.RailDirection:TokyoMetro.Honancho"

    @object.platform_infos.each do | platform_info |
      if platform_info.railway_line == railway_lines[ :main ] and platform_info.car_composition == 6
        if platform_info.transfer_infos.present?

          platform_info.transfer_infos.each do | transfer_info |
            ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
              transfer_info ,
              railway_line: { from: railway_lines[ :main ] , to: railway_lines[ :branch ] } ,
              railway_direction: for_honancho
            )
          end

        end
      end
    end

  end

  def to_convert?
    @object.same_as == "odpt.StationFacility:TokyoMetro.NakanoSakaue"
  end

end
