class TokyoMetro::Factory::Seed::Static::RailwayLine::Info::Relation < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::RailwayLine

  private

  def seed_main
    h = hashes_to_db
    if h.present?
      h.each do | h_item |
        db_class.find_or_create_by( h_item )
      end
    end
  end

  def hashes_to_db
    ary = ::Array.new

    if @info.is_branch_railway_line_info?
      @info.main_railway_line_infos.each do | main_railway_line_info |
        ary << {
          main_railway_line_info_id: railway_line_info_id( search_by: main_railway_line_info ) ,
          branch_railway_line_info_id: railway_line_info_id( search_by: @info.same_as )
        }
      end
    end

    if @info.has_branch_railway_line_infos?
      @info.branch_railway_line_infos.each do | branch_railway_line_info |
        ary << {
          branch_railway_line_info: railway_line_info_id( search_by: branch_railway_line_info ) ,
          main_railway_line_info_id: railway_line_info_id( search_by: @info.same_as )
        }
      end
    end

    ary
  end

  def method_name_for_db_instance_class
    :db_instance_class_of_relation
  end

end
