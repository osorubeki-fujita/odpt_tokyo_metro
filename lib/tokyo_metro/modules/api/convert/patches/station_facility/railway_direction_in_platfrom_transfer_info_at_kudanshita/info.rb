module TokyoMetro::Modules::Api::Convert::Patches::StationFacility::RailwayDirectionInPlatformTransferInfoAtKudanshita::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    convert_platform_transfer_infos_at_kudanshita
  end

  private

  def convert_platform_transfer_infos_at_kudanshita
    case @same_as
    when "odpt.StationFacility:TokyoMetro.Kudanshita"
      @platform_infos.each do | platform_info |
        if platform_info.transfer_infos.present?

          platform_info.transfer_infos.each do | transfer_info |
            ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
              transfer_info ,
              railway_line: "odpt.Railway:Toei.Shinjuku" ,
              railway_direction: { from: "odpt.Railway:Toei.Shinjuku" , to: "odpt.RailDirection:Toei.Shinjuku" }
            )
          end
  
        end
      end
    end
  end

end
