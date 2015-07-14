class TokyoMetro::Api::StationFacility::Info::BarrierFree::Facility::MetaClass::LinkForMobilityScooterAndStairlift::Info < TokyoMetro::Api::StationFacility::Info::BarrierFree::Info

  include ::TokyoMetro::Modules::Decision::Api::StationFacility::BarrierFree::WheelChair::Accessibility::All
  include ::TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::WheelChair::Accessibility::AliasTowardsAvailability
  include ::TokyoMetro::Modules::Alias::Common::StationFacility::BarrierFree::WheelChair
  include ::TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::WheelChair

  include ::TokyoMetro::Modules::Decision::Api::StationFacility::BarrierFree::MobilityScooter::Accessibility::All
  include ::TokyoMetro::Modules::Decision::Api::StationFacility::BarrierFree::MobilityScooter::Accessibility::AliasTowardsAvailability
  include ::TokyoMetro::Modules::Alias::Common::StationFacility::BarrierFree::MobilityScooter
  include ::TokyoMetro::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::MobilityScooter

end
