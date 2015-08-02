class TokyoMetro::Api::StationTimetable::Info::Fundamental::Info::Separated::Info

  include ::TokyoMetro::ClassNameLibrary::Api::StationTimetable
  include ::TokyoMetro::Modules::Fundamental::Api::Common::NotRealTime

  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Info

  def initialize( station , railway_line , operator , railway_direction )
    @station = station
    @railway_line = railway_line
    @operator = operator
    @railway_direction = railway_direction
  end

  attr_reader :station
  attr_reader :railway_line
  attr_reader :operator
  attr_reader :railway_direction

  def self.factory_for_seeding_instance_of_this_class
    factory_for_seeding_fundamental_info_separeted_info
  end

end
