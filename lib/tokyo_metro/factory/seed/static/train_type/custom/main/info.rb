class TokyoMetro::Factory::Seed::Static::TrainType::Custom::Main::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::Custom::Main

  include ::TokyoMetro::Factory::Seed::Reference::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::TrainTypeInApi

  def initialize( *args )
    super( *args , to_get_id: true )
  end

  private

  def hash_to_db
    h = ::Hash.new

    h[ :same_as ] = @info.same_as

    h[ :in_api_id ] = in_api_id
    h[ :railway_line_info_id ] = railway_line_info_id

    h[ :color_info_id ] = color_info_id

    h
  end

  [ :in_api_in_db , :in_api_id ].each do | method_name |
    eval <<-DEF
      def #{method_name}( whole = nil , search_by: @info.train_type.same_as )
        super( whole , search_by: search_by )
      end
    DEF
  end

  def color_info_id
    self.class.db_instance_class_of_color_info.find_or_create_by( color: design_color_info_id , bgcolor: design_bgcolor_info_id ).id
  end

  def design_color_info_id
    ::Design::Color::Info.find_or_create_by( hex_color: @info.color.hex_color ).id
  end

  def design_bgcolor_info_id
    ::Design::Color::Info.find_or_create_by( hex_color: @info.bgcolor.hex_color ).id
  end

  # @!group Optional Infos

  def seed_optional_infos
    seed_specific_operation_days
    seed_remarkable_stops
  end

  def seed_specific_operation_days
    if @info.specific_operation_days.present?
      @info.specific_operation_days.each do | specific_operation_day |
        ::Train::Type::SpecificOperationDay.find_or_create_by( train_type_info_id: @id , specific_operation_day_id: ::OperationDay.find_by( same_as: specific_operation_day ) )
      end
    end
  end

  def seed_remarkable_stops
    if @info.remarkable_stops.present?
      @info.remarkable_stops.each do | remarkable_stop |
        ::Train::Type::RemarkableStop.find_or_create_by( train_type_info_id: @id , remarkable_stop_id: ::Station::Info.find_by( same_as: remarkable_stop) )
      end
    end
  end

  # @!endgroup

end

__END__

[
  :note
].each do | key_name |
  h[ key_name ] = @info.send( key_name )
end
