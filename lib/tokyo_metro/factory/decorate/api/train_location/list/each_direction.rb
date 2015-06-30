class TokyoMetro::Factory::Decorate::Api::TrainLocation::List::EachDirection < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , railway_line , railway_direction_in_api_same_as , train_location_infos )
    super( request )
    @railway_line = railway_line
    @railway_direction = ::RailwayDirection.find_by( railway_line: @railway_line , in_api_same_as: railway_direction_in_api_same_as )
    # if @railway_direction.blank? and @railway_line.namboku_line?
      # @railway_direction = ::RailwayDirection.find_by( railway_line: ::RailwayLine.find_by( same_as: "odpt.Railway:Toei.Mita" ) , in_api_same_as: railway_direction_in_api_same_as )
    # end
    unless @railway_direction.present?
      raise "\[Error\] railway_line: #{ @railway_line.same_as } / railway_direction: #{ railway_direction_in_api_same_as }"
    end
    @train_location_infos = train_location_infos
  end

  attr_reader :railway_direction

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
= railway_direction.decorate.render_title_in_train_location
%ul{ class: [ :train_locations_of_each_direction , :clearfix ] }
  - train_location_infos.each do | train_location |
    = train_location.decorate( request , railway_line ).render
    HAML
  end

  private

  def h_locals
    super.merge({
      railway_line: @railway_line ,
      railway_direction: @railway_direction ,
      train_location_infos: @train_location_infos
    })
  end

end
