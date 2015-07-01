class TokyoMetro::Factory::BeforeDecorate::Api::TrainLocation::List

  def initialize( object )
    @object = object
  end

  attr_reader :object

  def group_by_railway_direction( railway_line_in_db )
    @object.group_by { | item | item.before_decorate.railway_direction( railway_line_in_db ) }
  end

end
