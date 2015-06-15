class TokyoMetro::Factory::Convert::Common::Api::StationFacility::PlatformInfo

  def initialize( info , railway_line , railway_direction , car_composition )
    raise unless info.present?
    raise unless railway_line.present?
    @info = info
    @railway_line_for_conversion = ForConversion.new( railway_line , :railway_line , :string? , arrow_blank: false )
    @railway_direction_for_conversion = ForConversion.new( railway_direction , :railway_direction , :string? )
    @car_composition_for_conversion = ForConversion.new( car_composition , :car_composition , :integer? )
  end

  def process
    if to_process?
      infos_for_conversion.each do | info_for_conversion |
        info_for_conversion.process.call( @info )
      end
    end
  end

  def self.process( info , railway_line: nil , railway_direction: nil , car_composition: nil )
    self.new( info , railway_line , railway_direction , car_composition ).process
  end

  private

  def to_process?
    infos_for_conversion.all? { | item | item.match?( @info ) }
  end

  def infos_for_conversion
    [ @railway_line_for_conversion , @railway_direction_for_conversion , @car_composition_for_conversion ]
  end

  class ForConversion

    def initialize( for_conversion , attr_of_info , method_for_deciding_default_value , arrow_blank: true )
      @for_conversion = for_conversion
      @attr_of_info = attr_of_info
      @method_for_deciding_default_value = method_for_deciding_default_value
      @arrow_blank = arrow_blank
    end

    def match?( info )
      ( arrow_blank? and @for_conversion.blank? ) or ( valid? and info.send( @attr_of_info ) == @for_conversion ) or ( @for_conversion.hash? and info.send( @attr_of_info ) == @for_conversion[ :from ] and @for_conversion[ :from ].send( @attr_of_info ) )
    end

    def valid?
      @for_conversion.send( @method_for_deciding_default_value )
    end

    def process
      ::Proc.new { | info |
        if to_process?( info )
          attr_of_info = @attr_of_info
          replaced_by = @info.send( @attr_of_info )[ :to ]
          info.instance_eval do
            eval( "@#{ attr_of_info }" ) = replaced_by
          end
        end
      }
    end

    private

    def arrow_blank?
      @arrow_blank
    end

    def to_process?( info )
      @info.send( @attr_of_info ).hash? and @info.send( @attr_of_info )[ :to ].present? and @info.send( @attr_of_info )[ :to ].send( @method_for_deciding_default_value )
    end

  end

end
