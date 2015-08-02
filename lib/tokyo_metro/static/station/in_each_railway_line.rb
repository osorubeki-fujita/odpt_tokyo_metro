# 個別の路線の、複数の駅情報を扱うクラス（ハッシュ）
class TokyoMetro::Static::Station::InEachRailwayLine < ::TokyoMetro::Static::Fundamental::Hash

  include ::TokyoMetro::ClassNameLibrary::Static::Station
  include ::TokyoMetro::Modules::ToFactory::Static::Generate::Group::OneYaml
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Hash

  def stations
    self.keys
  end

  def seed( railway_line , indent )
    super( railway_line , not_on_the_top_layer: true , indent: indent )
  end

  def self.factory_for_generating_from_saved_file_for_this_class
    factory_for_generating_from_each_saved_file
  end

  def self.factory_for_seeding_instance_of_this_class
    factory_for_seeding_subhash
  end

end
