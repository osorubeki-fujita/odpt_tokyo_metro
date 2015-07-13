class TokyoMetro::Factory::Seed::Api::StationFacility::Info::BarrierFree::Facility::Toilet::Assistant < TokyoMetro::Factory::Seed::Api::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  private

  def set_optional_variables( args )
    set_optional_variables__check_length_of_args( args , 1 )
    @barrier_free_facility_info_id = args.first
  end

  def hash_to_db
    {
      info_id: @barrier_free_facility_info_id ,
      pattern_id: pattern_id
    }
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_toilet_assistant
  end

  def pattern_in_db
    ::BarrierFreeFacility::ToiletAssistant::Pattern.find_or_create_by( @info.to_h )
  end

  def pattern_id
    pattern_in_db.id
  end

end
