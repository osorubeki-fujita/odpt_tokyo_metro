class TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Converter

  def initialize( info , railway_line , railway_direction , car_composition )
    raise unless info.present?
    @info = info
    @railway_line_for_conversion = self.class.class_of_info_for_conversion.new( railway_line , :railway_line , :string? )
    @railway_direction_for_conversion = self.class.class_of_info_for_conversion.new( railway_direction , :railway_direction , :string? )
    @car_composition_for_conversion = self.class.class_of_info_for_conversion.new( car_composition , :car_composition , :integer? )
  end

  def self.process( info , railway_line: nil , railway_direction: nil , car_composition: nil )
    self.new( info , railway_line , railway_direction , car_composition ).process
  end

  private

  def infos_for_conversion
    [ @railway_line_for_conversion , @railway_direction_for_conversion , @car_composition_for_conversion ]
  end

end
