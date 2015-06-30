class TokyoMetro::Factory::Decorate::Api::TrainLocation::List < TokyoMetro::Factory::Decorate::Api::MetaClass::RealTime::Info

  def initialize( request , obj , railway_line )
    super( request , obj )
    @railway_line = railway_line
  end

  attr_reader :railway_line

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
- grouped_by_railway_direction.each do | list_of_each_direction |
  = list_of_each_direction.render
    HAML
  end

  private

  def h_locals
    super.merge({
      grouped_by_railway_direction: grouped_by_railway_direction
    })
  end

  def grouped_by_railway_direction
    @object.group_by_railway_direction_in_decorator.map { | railway_direction_in_api_same_as , train_location_infos |
      ::TokyoMetro::Factory::Decorate::Api::TrainLocation::List::EachDirection.new( @request , @railway_line , railway_direction_in_api_same_as , train_location_infos )
    }.sort_by { | item |
      item.railway_direction.id
    }
  end

end
