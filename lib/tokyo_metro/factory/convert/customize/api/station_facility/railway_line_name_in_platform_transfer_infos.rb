module TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos

  include ::TokyoMetro::Modules::Common::ConvertConstantToClassMethod

  REPLACING_RAILWAY_LINES = ::YAML.load_file(
    "#{ ::TokyoMetro::dictionary_dir }/additional_infos/customize/station_facility/transfer_info/replacing_railway_lines.yaml"
  )

end
