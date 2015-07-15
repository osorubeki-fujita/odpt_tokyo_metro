class TokyoMetro::Factory::Convert::Customize::Api::Station::ConnectingRailwayLine::Info < TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info

  include ::TokyoMetro::Modules::MethodMissing::Constant::Common::ConvertToClassMethod

  [
    :replacing_railway_lines ,
    :ignored_railway_lines ,
    :optional_railway_lines ,
    :new_and_old_railway_lines ,
    :index_in_stations ,
    :transfer_additional_infos
  ].each do | filename |
    const_set(
      filename.upcase ,
      ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/additional_infos/customize/station/connecting_railway_line/#{ filename }.yaml" )
    )
  end

  def initialize( object )
    # puts "----"
    # puts @object.same_as
    # if @object.connecting_railway_lines.present?
      # puts @object.connecting_railway_lines.map( &:railway_line ).to_s
    # end
    super(
      object ,
      REPLACING_RAILWAY_LINES ,
      IGNORED_RAILWAY_LINES
    )
  end

  def process
    if to_process?
      convert_connecting_railway_line_infos
      add_optional_railway_lines
      set_new_and_old_railway_lines
      set_index_in_station
      set_transfer_additional_infos
    end
  end

  private

  # @!group add_optional_railway_lines

  def add_optional_railway_lines
    @optional_railway_lines = optional_railway_lines_for_this_object

    if @optional_railway_lines.present?
      set_new_connecting_railway_line_list_unless_exist
      @optional_railway_lines.each do | item |
        item[ "railway_lines" ].each do | railway_line |
          @object.connecting_railway_lines << self.class.connecting_railway_line_info_class.new( railway_line )
        end
      end
    end

  end

  def optional_railway_lines_for_this_object
    OPTIONAL_RAILWAY_LINES.select { | item | item[ "stations" ].include?( @object.same_as ) }
  end

  # @!group set_new_and_old_railway_lines

  def set_new_and_old_railway_lines
    @new_or_old_railway_lines = new_or_old_railway_lines_for_this_object

    if @new_or_old_railway_lines.present?
      set_new_connecting_railway_line_list_unless_exist
      @new_or_old_railway_lines.each do | railway_line_name , info |
        info_of_this_railway_line = @object.connecting_railway_lines.find { | item | item.railway_line == railway_line_name }
        if info_of_this_railway_line.present?
          info_of_this_railway_line.send( :set_start_on , info[ "start_on" ] )
          info_of_this_railway_line.send( :set_end_on , info[ "end_on" ] )
        else
          @object.connecting_railway_lines << self.class.connecting_railway_line_info_class.new( railway_line_name , start_on: info[ "start_on" ] , end_on: info[ "end_on" ] )
        end
      end
    end

  end

  def new_or_old_railway_lines_for_this_object
    NEW_AND_OLD_RAILWAY_LINES.select { | new_railway_line_name , info | info[ "stations" ].include?( @object.same_as ) }
  end

  # @!group set_index_in_station

  def set_index_in_station
    @index_in_this_station = index_in_this_station
    if @index_in_this_station.present?
      @object.connecting_railway_lines.each do | connecting_railway_line_info |
        index_info_of_this_railway_line = @index_in_this_station[ connecting_railway_line_info.railway_line ]
        unless index_info_of_this_railway_line.present?
          raise "Error: index of #{ connecting_railway_line_info.railway_line } in \"#{@same_as}\" is not defined."
        end

        connecting_railway_line_info.send( :set_index_in_station , index_info_of_this_railway_line[ "index_in_station" ] )
        if index_info_of_this_railway_line[ "cleared" ]
          connecting_railway_line_info.send( :set_cleared )
        end

      end

      @object.connecting_railway_lines.sort!
    else
      @object.connecting_railway_lines.try( :set_index_in_station! )
    end

  end

  def index_in_this_station
    INDEX_IN_STATIONS[ @object.same_as ]
  end

  # @!group set_transfer_additional_infos

  def set_transfer_additional_infos
    @transfer_additional_infos_for_this_station = transfer_additional_infos_for_this_station
    if @transfer_additional_infos_for_this_station.present?
      check_validity_of_transfer_additional_infos_for_this_station
      set_transfer_additional_infos_to_each_railway_line_info
    end
  end

  def transfer_additional_infos_for_this_station
    ary =TRANSFER_ADDITIONAL_INFOS.select { | item | item[ "stations" ].include?( @object.same_as ) }
    if ary.present?
      h = ::Hash.new
      ary.each do | item |
        h.update( item[ "railway_lines" ] )
      end
      h
    else
      nil
    end
  end

  def check_validity_of_transfer_additional_infos_for_this_station
    @transfer_additional_infos_for_this_station.keys.each do | railway_line |
      unless connecting_railway_line_names.include?( railway_line )
        error_msg = "\n"
        error_msg << "Error: \"#{ @object.same_as }\" on \"#{ @object.railway_line }\" should be connected to \"#{ railway_line }\".\n"
        error_msg << "connnected to:\n"
        error_msg << @object.connecting_railway_lines.map( &:railway_line ).join( "\n" )
        error_msg << "\n"
        error_msg << "keys: \n"
        error_msg << @transfer_additional_infos_for_this_station.keys.join( "\n" )
        raise error_msg
      end
    end
  end

  def set_transfer_additional_infos_to_each_railway_line_info
    @object.connecting_railway_lines.each do | connecting_railway_line_info |
      additional_info_of_this_railway_line = @transfer_additional_infos_for_this_station[ connecting_railway_line_info.railway_line ]

      if additional_info_of_this_railway_line.present?
        set_connecting_info_to_another_station( connecting_railway_line_info , additional_info_of_this_railway_line )
        set_not_recommended( connecting_railway_line_info , additional_info_of_this_railway_line )
        set_hidden_on_railway_line_page( connecting_railway_line_info , additional_info_of_this_railway_line )
        set_note( connecting_railway_line_info , additional_info_of_this_railway_line )
      end

    end
  end

  def set_connecting_info_to_another_station( connecting_railway_line_info , additional_info_of_this_railway_line )
    set_specific_transfer_additional_info( connecting_railway_line_info , additional_info_of_this_railway_line , :connecting_another_station , require_h_info: true )
  end

  def set_not_recommended( connecting_railway_line_info , additional_info_of_this_railway_line )
    set_specific_transfer_additional_info( connecting_railway_line_info , additional_info_of_this_railway_line , :not_recommended , require_h_info: false )
  end

  def set_hidden_on_railway_line_page( connecting_railway_line_info , additional_info_of_this_railway_line )
    set_specific_transfer_additional_info( connecting_railway_line_info , additional_info_of_this_railway_line , :hidden_on_railway_line_page , require_h_info: false )
  end

  def set_note( connecting_railway_line_info , additional_info_of_this_railway_line )
    set_specific_transfer_additional_info( connecting_railway_line_info , additional_info_of_this_railway_line , :note , require_h_info: true )
  end

  def set_specific_transfer_additional_info( connecting_railway_line_info , additional_info_of_this_railway_line , key_of_h , require_h_info: false )
    if additional_info_of_this_railway_line[ key_of_h.to_s ].present?
      args = ::Array.new
      args << "set_#{key_of_h}"
      if require_h_info
        args <<  additional_info_of_this_railway_line[ key_of_h.to_s ]
      end
      connecting_railway_line_info.send( *args )
    end
  end

  # @!group Common method

  def connecting_railway_line_names
    @object.connecting_railway_lines.map( &:railway_line )
  end

  def set_new_connecting_railway_line_list_unless_exist
    unless @object.connecting_railway_lines.present?
      @object.instance_variable_set( :@connecting_railway_lines , self.class.connecting_railway_line_list_class.new )
    end
  end

  # @!endgroup

end
