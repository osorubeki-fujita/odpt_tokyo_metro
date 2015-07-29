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
    seed_note
    seed_additional_infos

    seed_specific_operation_days
    seed_remarkable_stops
    seed_through_operation_infos
  end

  def seed_note
    if @info.note.present?
      note_text = ::Train::Type::Note::Text.find_or_create_by( text_ja: note )
      ::Train::Type::Note::Info.find_or_create_by( info_id: @id , text_id: note_text.id )
    end
  end

  def seed_additional_infos
    raise unless @info.additional_infos.present? and @info.note.blank?
    if @info.additional_infos.present?
      @info.additional_infos.each.with_index(1) do | additional_info , i |
        additional_text = ::Train::Type::Note::Additional::Text.find_or_create_by( text_ja: additional_info )
        ::Train::Type::Note::Additional::Info.find_or_create_by( info_id: @id , additional_text_id: additional_text.id , index: 1 )
      end
    end
  end

  def seed_specific_operation_days
    if @info.specific_operation_days.present?
      @info.specific_operation_days.each do | specific_operation_day |
        ::Train::Type::SpecificOperationDay.find_or_create_by( train_type_info_id: @id , specific_operation_day_id: ::OperationDay.find_by( same_as: specific_operation_day ) )
      end
    end
  end

  def seed_remarkable_stop_infos
    if @info.remarkable_stop_infos.present?
      @info.remarkable_stop_infos.each do | remarkable_stop_info |
        ::Train::Type::RemarkableStopInfo.find_or_create_by( train_type_info_id: @id , remarkable_stop_info_id: ::Station::Info.find_by( same_as: remarkable_stop_info ) )
      end
    end
  end

  def seed_through_operation_infos
    if @info.through_operation_infos.present?
      @info.through_operation_infos.each do | through_operation_info |
        raise unless through_operation_info[ :railway_line ].present?
        railway_line_info_id = ::Railway::Line::Info.find_by( same_as: through_operation_info[ :railway_line ] ).id
        raise "\'#{ through_operation_info[ :railway_line ] }\' does not exist." unless railway_line_info.present?
        to_statin_info_id = ::Station::Info.find_by( same_as: through_operation_info[ :to_station ]).try( :id )
        ::Train::Type::ThroughOperationInfo.find_or_create_by( info_id: @id , railway_line_info_id: railway_line_info_id , to_station_id: to_station_id )
      end
    end
  end



  # @!endgroup

end
