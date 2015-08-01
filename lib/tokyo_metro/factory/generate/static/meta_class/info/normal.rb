class TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  def initialize(h)
    super(h)

    before_setting_values_to_hash_for_making_variables
    set_values_to_hash_for_making_variables

    # puts "same_as: #{ same_as }"
    # puts "hash keys: #{ @h.keys }"
  end

  private

  def before_setting_values_to_hash_for_making_variables
    return nil
  end

  def variables_from_hash_keys( hash_key_array: self.class.hash_keys , info: @hash_for_making_variables )
    if info.nil?
      super( hash_key_array: hash_key_array )
    elsif info.kind_of?( ::Hash )
      hash_key_array.map { | key_name | info[ key_name ] }
    else
      hash_key_array.map { | key_name | info.send( key_name ) }
    end
  end

  alias :variables_from_hash_keys__alias :variables_from_hash_keys

end
