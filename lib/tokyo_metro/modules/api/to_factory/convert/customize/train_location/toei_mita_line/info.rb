module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ToeiMitaLine::Info

  def initialize( *variables )
    super( *variables )
    convert_infos_of_toei_mita_line_train_on_namboku_line
  end

  private

  def convert_infos_of_toei_mita_line_train_on_namboku_line
    if toei_mita_line_train_including_on_namboku_line?
      ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::ToeiMitaLine::Info.process( self )
    end
  end

end
