# @note
#   This module is included
#     to {TokyoMetro::Api::StationFacility::Info}
#     by {TokyoMetro::Modules::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfo.set_modules} .
module TokyoMetro::Modules::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfo::Info

  # Constructor
  def initialize( *variables )
    super( *variables )
    convert_railway_line_names_in_platform_transfer_infos
  end

  private

  # @note
  #   This method uses the method 'replace_railway_line_info'
  #     in {TokyoMetro::Modules::Api::Convert::Common::StationInfos::ConvertRailwayLineNames::Info} .
  # @note
  #   {TokyoMetro::Modules::Api::Convert::Common::StationInfos::ConvertRailwayLineNames::Info} is included
  #     to {TokyoMetro::Api::StationFacility::Info}
  #     by {TokyoMetro::Modules::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfo.set_modules} .
  def convert_railway_line_names_in_platform_transfer_infos
    replacing_dictionary = ::TokyoMetro::Modules::Api::Convert::Customize::StationFacility::RailwayLineNameInPlatformTransferInfo.replacing_railway_lines
    ignored_dictionary = nil

    @platform_infos.each do | platform_info |
      if platform_info.transfer_infos.present?
        ary = self.class.platform_transfer_list_class.new

        platform_info.transfer_infos.each do | transfer_info |
          ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfo.process( transfer_info , ary , replacing_dictionary , ignored_dictionary , @same_as )
        end

        platform_info.instance_eval do
          @transfer_infos = ary
        end

      end
    end
  end

end
