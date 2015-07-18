module TokyoMetro::Factory::Convert::Patch::Api::TrainTimetable::YurakuchoLine
  
  include ::OdptCommon::Modules::MethodMissing::Constant::Common::ConvertToClassMethod

  INVALID_TRAINS = ::YAML.load_file( "#{::TokyoMetro::dictionary_dir}/additional_infos/patches/train_timetable/yurakucho_and_fukutoshin_line/invalid_trains_on_yurakucho_line.yaml" )

end
