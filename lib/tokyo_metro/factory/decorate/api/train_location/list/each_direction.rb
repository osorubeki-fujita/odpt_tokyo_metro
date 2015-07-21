class TokyoMetro::Factory::Decorate::Api::TrainLocation::List::EachDirection < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line_info , railway_direction_in_api_same_as , train_location_infos )
    super( request )
    @railway_line_info = railway_line_info
    @railway_direction = ::Railway::Direction.find_by( railway_line_info: @railway_line_info , in_api_same_as: railway_direction_in_api_same_as )
    unless @railway_direction.present?
      raise "\[Error\] railway_line_info: #{ @railway_line_info.same_as } / railway_direction: #{ railway_direction_in_api_same_as }"
    end
    @train_location_infos = train_location_infos
  end

  attr_reader :railway_direction

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
= railway_direction.decorate.render_title_in_train_location
%ul{ class: [ :train_locations_of_each_direction , :clearfix ] }
  - train_location_infos.each do | train_location |
    = train_location.decorate( request , railway_line_info ).render
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_line_info: @railway_line_info ,
      railway_direction: @railway_direction ,
      train_location_infos: @train_location_infos
    })
  end

end
