class TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::Normal < TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::MetaClass

  private

  def class_method_names_and_hash_keys
    {
      rdf_type: "\@type" , # (e.g.) ::TokyoMetro::Api::StationTimetable.rdf_type (Class Method)
      context: "\@context" # (e.g.) ::TokyoMetro::Api::StationTimetable.context (Class Method)
    }
  end

end
