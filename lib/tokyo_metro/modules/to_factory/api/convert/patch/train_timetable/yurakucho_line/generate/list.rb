module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::TrainTimetable::YurakuchoLine::Generate::List

  def generate( max = nil )
    ary = super( max )
    return ::TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine::Generate::List.updated( ary )
  end

end
