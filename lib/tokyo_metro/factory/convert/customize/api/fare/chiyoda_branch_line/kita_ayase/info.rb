class TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::KitaAyase::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  REGEXP = /Chiyoda(?=\.KitaAyase(?:\.|\Z))/

  def process
    if to_process_from_station?
      replace_same_as
      replace_from_station
    elsif to_process_to_station?
      replace_same_as
      replace_to_station
    end
  end

  private

  [ :from_station , :to_station ].each do | method_basename |
    eval <<-DEF
      def to_process_#{ method_basename }?
        REGEXP === @object.#{ method_basename }
      end
    DEF
  end

  [ :same_as , :from_station , :to_station ].each do | method_basename |
    eval <<-DEF
      def replace_#{ method_basename }
        new_var = @object.#{ method_basename }.gsub( REGEXP , "ChiyodaBranch" )
        @object.instance_variable_set( :@#{ method_basename } , new_var )
      end
    DEF
  end

end
