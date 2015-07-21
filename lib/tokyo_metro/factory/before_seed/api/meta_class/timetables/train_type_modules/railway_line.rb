module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::RailwayLine

  include ::OdptCommon::Modules::Decision::Common::RailwayLine::Name
  include ::TokyoMetro::Modules::Decision::Common::RailwayLine::Name

  private

  def on_the_railway_line_of?( *variables )
    super( *variables , @railway_line_info_in_db.same_as )
  end

end
