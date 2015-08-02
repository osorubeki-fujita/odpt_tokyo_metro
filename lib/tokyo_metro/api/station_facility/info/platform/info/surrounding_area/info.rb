class TokyoMetro::Api::StationFacility::Info::Platform::Info::SurroundingArea::Info < TokyoMetro::Api::StationFacility::Info::Platform::Info::Common::Info

  def initialize( name_ja )
    @name_ja = name_ja
  end

  attr_reader :name_ja

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_platform_surrounding_area_info_from_string
  end

  def self.factory_for_seeding_instance_of_this_class
    factory_for_seeding_platform_info_surrounding_area_info
  end

end
