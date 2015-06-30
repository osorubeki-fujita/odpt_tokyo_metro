module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ToeiMitaLine::Info

  def initialize( *variables )
    super( *variables )
    convert_infos_of_toei_mita_line_train_on_namboku_line
  end

  private

  def convert_infos_of_toei_mita_line_train_on_namboku_line
    if toei_mita_line_train_including_on_namboku_line?
      ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ToeiMitaLine::Info.process( self )
    end
  end

end
