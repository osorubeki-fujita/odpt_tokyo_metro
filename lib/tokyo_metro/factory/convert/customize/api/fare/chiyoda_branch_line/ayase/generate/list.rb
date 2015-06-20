class TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::Ayase::Generate::List

  REGEXP = /Chiyoda(?=\.Ayase(?:\.|\Z))/

  def initialize( obj , condition )
    @obj = obj
    @condition = condition
  end

  def process
    h = hash_for_variables
    variables = attr_names.map { | variable_name | h[ variable_name ] }
    ::TokyoMetro::Api::Fare::Info.new( *variables )
  end

  def self.process( obj , condition )
    self.new( obj , condition ).process
  end

  private

  def attr_names
    [ :id_urn , :same_as , :dc_date , :operator , :from_station , :to_station , :normal_fare ]
  end

  def hash_for_variables
    h = ::Hash.new

    h[ :same_as ] = @obj.same_as.gsub( REGEXP , "ChiyodaBranch" )

    [ :id_urn , :dc_date , :operator , :normal_fare , :from_station , :to_station ].each do | method_name |
      h[ method_name ] = @obj.send( method_name )
    end

    case @condition
    when :from_station
      h[ :from_station ] = h[ :from_station ].gsub( REGEXP , "ChiyodaBranch" )
    when :to_station
      h[ :to_station ] = h[ :to_station ].gsub( REGEXP , "ChiyodaBranch" )
    end

    h
  end

end
