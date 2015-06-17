module TokyoMetro::Modules::Api::Convert::Customize::StationFacility::PlatformTransferInfoAtNakanoSakaue::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    convert_platform_transfer_infos_at_nakano_sakaue
  end

  private

  def convert_platform_transfer_infos_at_nakano_sakaue
    case @same_as
    when "odpt.StationFacility:TokyoMetro.NakanoSakaue"
      marunouchi = "odpt.Railway:TokyoMetro.Marunouchi"
      marunouchi_branch = "odpt.Railway:TokyoMetro.MarunouchiBranch"
      for_honancho = "odpt.RailDirection:TokyoMetro.Honancho"

      @platform_infos.each do | platform_info |
        if platform_info.railway_line == marunouchi and platform_info.car_composition == 6
          if platform_info.transfer_infos.present?
            puts platform_info.inspect

            platform_info.transfer_infos.each do | transfer_info |
              ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
                transfer_info ,
                railway_line: { from: marunouchi , to: marunouchi_branch } ,
                railway_direction: for_honancho
              )
            end

          end
        end
      end

    end
  end

end
