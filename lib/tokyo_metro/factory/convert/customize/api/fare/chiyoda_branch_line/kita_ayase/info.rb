class TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::KitaAyase::Info

  REGEXP = /Chiyoda(?=\.KitaAyase(?:\.|\Z))/

  def initialize( obj )
    @obj = obj
  end

  def process
    if to_process_from_station?
      replace_same_as
      replace_from_station
    elsif to_process_to_station?
      replace_same_as
      replace_to_station
    end
  end

  def self.process( obj )
    self.new( obj ).process
  end

  private

  [ :from_station , :to_station ].each do | method_basename |
    eval <<-DEF
      def to_process_#{ method_basename }?
        REGEXP === @obj.#{ method_basename }
      end
    DEF
  end

  [ :same_as , :from_station , :to_station ].each do | method_basename |
    eval <<-DEF
      def replace_#{ method_basename }
        new_var = @obj.#{ method_basename }.gsub( REGEXP , "ChiyodaBranch" )
        @obj.instance_variable_set( :@#{ method_basename } , new_var )
      end
    DEF
  end

end
