module TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos

  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  REPLACING_RAILWAY_LINE_INFOS = ::YAML.load_file(
    "#{ ::TokyoMetro::dictionary_dir }/additional_infos/customize/station_facility/transfer_info/replacing_railway_line_infos.yaml"
  )

end
