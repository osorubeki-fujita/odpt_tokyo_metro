module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::StationTimetable::FukutoshinLineForWakoshi::Info

  def initialize( *args )
    super( *args )
    ::TokyoMetro::Factory::Convert::Patch::Api::StationTimetable::FukutoshinLineForWakoshi::Info.process( self )
  end

end
