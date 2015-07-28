class TokyoMetro::Factory::Generate::Static::TrainType::Custom::Main::Info < TokyoMetro::Factory::Generate::Static::TrainType::Custom::DefaultSetting::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::Custom::Main
  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  TITLE = "TrainTypeMain"

  def self.referenced_hash
    ::TokyoMetro::Static.train_types_other_operator.merge( ::TokyoMetro::Static.train_types_default )
  end

  # @example
  # TokyoMetro::Factory::Generate::Static::TrainType::Custom::Main::Info.hash_keys
  #   => [:train_type, :bgcolor, :color, :operator, :railway_line, :note]
  def self.hash_keys
    super + hash_keys_for_note + hash_keys_for_additional_infos
  end

  def self.hash_keys_for_note
    [ :note ]
  end

  def self.hash_keys_for_additional_infos
    [ :additional_infos ,  :through_to , :specific_operation_days , :remarkable_stop_infos ]
  end

  private

  def set_values_to_hash_for_making_variables_when_reference_is_used
    set_values_to_hash_for_making_variables_from_referenced_info( hash_key_array: self.class.hash_keys_for_fundamental_infos )
    # puts "1: " + @hash_for_making_variables.to_s
    set_values_to_hash_for_making_variables__alias( hash_key_array: self.class.hash_keys_for_operator_and_railway_line )
    # puts "2: " + @hash_for_making_variables.to_s
    set_values_to_hash_for_making_variables__alias( hash_key_array: self.class.hash_keys_for_note )
    # puts "3: " + @hash_for_making_variables.to_s
    set_values_to_hash_for_making_variables__alias( hash_key_array: self.class.hash_keys_for_additional_infos , make_array: true )
    # puts "4: " + @hash_for_making_variables.to_s
  end

  def set_values_to_hash_for_making_variables_when_reference_is_not_used
    super
    set_values_to_hash_for_making_variables__alias( hash_key_array: self.class.hash_keys_for_note )
    set_values_to_hash_for_making_variables__alias( hash_key_array: self.class.hash_keys_for_additional_infos , make_array: true )
  end

  def variables_from_hash_keys
    variables_from_hash_keys__alias( hash_key_array: self.class.hash_keys )
  end

  def decinding_keys_in_variables_from_hash
    @h.keys - ( self.class.hash_keys_for_operator_and_railway_line + self.class.hash_keys_for_note + self.class.hash_keys_for_additional_infos + [ :stopping_pattern ] ).map( &:to_s )
  end

  def check_varidity_of_referenced_info( info )
    super( info , include_ancestors: true )
  end

end
