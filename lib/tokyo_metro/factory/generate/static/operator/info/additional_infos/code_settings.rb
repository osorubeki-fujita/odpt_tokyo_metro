class TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionalInfos::CodeSettings < TokyoMetro::Factory::Generate::Static::MetaClass::Info::SubInfo

  include ::TokyoMetro::ClassNameLibrary::Static::Operator

  def self.hash_keys
    [ :railway_line , :station ]
  end

  def self.info_class_for_this_class
    code_settings_class
  end

  private

  def set_values_to_hash_for_making_variables
    @hash_for_making_variables[ :railway_line ] = railway_line_instance
    @hash_for_making_variables[ :station ] = station_instance
  end

  def railway_line_instance
    ::TokyoMetro::Static::Operator::Info::AdditionalInfos::CodeSettings::RailwayLine.generate_from_hash( @h[ :railway_line ] )
  end

  def station_instance
    ::TokyoMetro::Static::Operator::Info::AdditionalInfos::CodeSettings::Station.generate_from_hash( @h[ :station ] )
  end

end
