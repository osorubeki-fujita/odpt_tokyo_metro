module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::TrainTimetable::YurakuchoLine::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Generate::List.updated( ary )
  end

end
