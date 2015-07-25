class TokyoMetro::Factory::Seed::Static::RailwayLine::Info::Code < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine

  def initialize( *args )
    super( *args , to_get_id: true )
  end

  private

  def set_optional_variables( info_id )
    @info_id = info_id
    @codes = @info.codes
    @colors = @info.colors
    @to_seed = [ @codes , @colors ].all?( &present? )

    if @to_seed
      raise unless [ @codes , @colors ].all?( &:array? )
      raise unless @codes.length == @colors.length
    end
  end

  def groups_of_code_and_color
    [ @codes , @colors ].transpose
  end

  def seed
    if @to_seed
      groups_of_code_and_color.each.with_index(1) do | ( code , color ) , i |
        seed_main( code , color , i )
        seed_optional_infos(i)
      end
    end
  end

  def seed_main( code , color , i )
    @id = db_class.find_or_create_by( code: code , color: color ).id
  end

  def seed_optional_infos(i)
    self.class.db_instance_class_of_info_code( info_id: @info_id , code_id: @id , index: i )
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_code
  end

end
