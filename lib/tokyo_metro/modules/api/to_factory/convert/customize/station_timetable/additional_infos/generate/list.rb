module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationTimetable::AdditionalInfos::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::AdditionalInfos::Generate::List.updated( ary )
  end

end
