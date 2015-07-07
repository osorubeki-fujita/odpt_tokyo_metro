module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::MarunouchiBranchLine::Info

  # Constructor
  # @note {::TokyoMetro::Api::StationTimetable::Info#.initialize} に機能を追加する。
  # @return [::TokyoMetro::Api::StationTimetable::Info]
  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::MarunouchiBranchLine::Info.process( self )
  end

end
