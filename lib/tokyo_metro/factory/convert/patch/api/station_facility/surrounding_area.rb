module TokyoMetro::Factory::Convert::Patch::Api::StationFacility::SurroundingArea

  include ::TokyoMetro::Modules::Fundamental::ConvertConstantToClassMethod

  DICTIONARY = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/additional_infos/patches/station_facility/surrounding_areas.yaml" )

end
