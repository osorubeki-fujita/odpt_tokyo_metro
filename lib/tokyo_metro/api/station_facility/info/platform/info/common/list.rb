class TokyoMetro::Api::StationFacility::Info::Platform::Info::Common::List < Array

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::List

  def seed( platform_info_id )
    super( platform_info_id , not_on_the_top_layer: true , no_display: true , display_number: false )
  end

end
