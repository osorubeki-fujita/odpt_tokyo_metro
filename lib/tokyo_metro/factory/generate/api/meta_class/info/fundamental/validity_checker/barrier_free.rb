class TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::BarrierFree < TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::MetaClass

  private

  def class_method_names_and_hash_keys
    {
      rdf_type_of_facility: "\@type" ,
      category_name: "ugsrv:categoryName" , # (e.g.) ::TokyoMetro::Api::StationFacility::Info::BarrierFree::Toilet.category_name (Class Method)
      spac__is_available_to: "spac:isAvailableTo" # (e.g.) ::TokyoMetro::Api::StationFacility::Info::BarrierFree::LinkForMobilityScooter.spac__is_available_to (Class Method)
    }
  end

end
