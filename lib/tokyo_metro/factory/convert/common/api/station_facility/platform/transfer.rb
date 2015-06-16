class TokyoMetro::Factory::Convert::Common::Api::StationFacility::Platform::Transfer < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Converter

  def initialize( info , railway_line , railway_direction , necessary_time )
    raise unless info.present?
    @info = info
    @railway_line_for_conversion = self.class.class_of_info_for_conversion.new( railway_line , :railway_line , :string? )
    @railway_direction_for_conversion = self.class.class_of_info_for_conversion.new( railway_direction , :railway_direction , :string? )
    @necessary_time_for_conversion = self.class.class_of_info_for_conversion.new( necessary_time , :necessary_time , :integer? )
  end

  def self.process( info , railway_line: nil , railway_direction: nil , necessary_time: nil )
    self.new( info , railway_line , railway_direction , necessary_time ).process
  end

  private

  def infos_for_conversion
    [ @railway_line_for_conversion , @railway_direction_for_conversion , @necessary_time_for_conversion ]
  end

end
