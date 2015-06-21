module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::ChiyodaBranchLine::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    convert_platform_infos_related_to_chiyoda_branch_line
  end

  private

  def convert_platform_infos_related_to_chiyoda_branch_line
    case @same_as
    when "odpt.StationFacility:TokyoMetro.Ayase"
      convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
      convert_railway_line_name_of_transfer_infos_to_chiyoda_branch_line

    when "odpt.StationFacility:TokyoMetro.KitaAyase"
      convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
    end
  end

  def convert_railway_line_name_of_platform_infos_to_chiyoda_branch_line
    @platform_infos.each do | info |
      ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform.process(
        info ,
        car_composition: 3 ,
        railway_line: { from: "odpt.Railway:TokyoMetro.Chiyoda" , to: "odpt.Railway:TokyoMetro.ChiyodaBranch" }
      )
    end
  end

  def convert_railway_line_name_of_transfer_infos_to_chiyoda_branch_line
    @platform_infos.each do | platform_info |
      if platform_info.transfer_infos.present?

        platform_info.transfer_infos.each do | transfer_info |
          ::TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer.process(
            transfer_info ,
            railway_line: { from: "odpt.Railway:TokyoMetro.Chiyoda" , to: "odpt.Railway:TokyoMetro.ChiyodaBranch" } ,
            railway_direction: "odpt.RailDirection:TokyoMetro.KitaAyase"
          )
        end

      end
    end
  end

end