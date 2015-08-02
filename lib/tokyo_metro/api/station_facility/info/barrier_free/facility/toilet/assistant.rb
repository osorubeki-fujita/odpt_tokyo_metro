# トイレの補助設備の情報
class TokyoMetro::Api::StationFacility::Info::BarrierFree::Facility::Toilet::Assistant

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility
  include ::TokyoMetro::Modules::ToFactory::Common::Generate::Info
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Info

  include ::TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::WheelChair::Accessibility::AliasTowardsAvailability
  include ::OdptCommon::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::WheelChair
  include ::OdptCommon::Modules::Alias::Common::StationFacility::BarrierFree::WheelChair

  include ::TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::ToiletAssistant
  include ::OdptCommon::Modules::Attributes::Common::StationFacility::BarrierFree::ToiletAssistant
  include ::OdptCommon::Modules::MethodMissing::Decision::Common::StationFacility::BarrierFree::ToiletAssistant

  def initialize( wheel_chair_accessible , baby_chair , baby_changing_table , ostomate )
    @wheel_chair_accessible = wheel_chair_accessible
    @baby_chair = baby_chair
    @baby_changing_table = baby_changing_table
    @ostomate = ostomate
  end

  # 車いすが利用可能か否か
  # @return [Boolean]
  attr_reader :wheel_chair_accessible

  # 幼児用の椅子が設置されているか否か
  # @return [Boolean]
  attr_reader :baby_chair

  # おむつ交換台が設置されているか否か
  # @return [Boolean]
  attr_reader :baby_changing_table

  # オストメイト設備が設置されているか否か
  # @return [Boolean]
  attr_reader :ostomate

  # @!group クラスメソッド

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_barrier_free_toilet_assistant_from_hash
  end

  def self.factory_for_seeding_instance_of_this_class
    factory_for_seeding_toilet_service_detail_assistant_info
  end

  # @!endgroup

end
