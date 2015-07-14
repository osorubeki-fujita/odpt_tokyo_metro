module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::RailwayLine

  include ::TokyoMetro::Modules::Decision::Common::RailwayLine

  private

  def on_the_railway_line_of?( *variables )
    super( *variables , @railway_line_in_db.same_as )
  end

end
