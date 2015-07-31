class TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionalInfos < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::Operator


  def self.hash_keys
    [ :color , :numbering , :code , :code_settings ]
  end

  def self.info_class_for_this_class
    additional_infos_class
  end

  def initialize(h)
    @h = h.with_indifferent_access
    @hash_for_making_variables = ::Hash.new.with_indifferent_access
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :numbering , :code ] )
    @hash_for_making_variables[ :color ] = color_instance
    @hash_for_making_variables[ :code_settings ] = code_settings
  end

  def color_instance
    unless has_color?
      raise "Error"
    end
    @hash_for_making_variables[ :color ] = ::TokyoMetro::Static::Color::generate_from_hash( @h[ :color ] )
  end

  def code_settings
    ::TokyoMetro::Static::Operator::Info::AdditionalInfos::CodeSettings.generate_from_hash( @h[ :code_settings ] )
  end

  def has_color?
    @hash_for_making_variables[ :color ].present?
  end

  def has_station_number?
    @hash_for_making_variables[ :numbering ]
  end

end
