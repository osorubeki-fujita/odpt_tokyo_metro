class TokyoMetro::Api::Station::Info::Exit::Info < TokyoMetro::Api::Station::Info::Common::Info

  def initialize( point_id_urn )
    @point_id_urn = point_id_urn
  end

  attr_reader :point_id_urn

  def self.factory_for_generating_instance_of_this_class
    factory_for_generating_exit_from_string
  end

  def self.factory_for_seeding_this_class
    factory_for_seeding_exit
  end

end
