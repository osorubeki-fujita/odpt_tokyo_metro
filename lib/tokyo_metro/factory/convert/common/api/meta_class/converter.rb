class TokyoMetro::Factory::Convert::Common::Api::MetaClass::Converter

  def process
    if to_process?
      infos_for_conversion.each do | info_for_conversion |
        info_for_conversion.process.call( @info )
      end
    end
  end

  def self.process
    raise "The class method \'#{ __method __ }\' is not defined in \'#{ self }\'."
  end

  private

  def to_process?
    infos_for_conversion.all? { | item | item.match?( @info ) }
  end

  def infos_for_conversion
    raise "The method \'#{ __method __ }\' is not defined in \'#{ self.class }\'."
  end

  def self.class_of_info_for_conversion
    ::TokyoMetro::Factory::Convert::Common::Api::MetaClass::Converter::InfoForConversion
  end

end
