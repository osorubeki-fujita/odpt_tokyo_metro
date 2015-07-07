class TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::ChiyodaBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  REGEXP = /(?<=\Aodpt\.StationTimetable\:TokyoMetro\.)Chiyoda(?=\.(?:KitaAyase\.Ayase|Ayase\.KitaAyase)\Z)/

  def process
    if to_convert?
      convert_railway_line_name
      set_refinement_module_to_fundamental_infos
      convert_fundamental_infos
    end
  end

  private

  # @note @railway_line を "odpt.Railway:TokyoMetro.ChiyodaBranchLine" で統一する。
  def to_convert?
    @object.same_as?( REGEXP )
  end

  def convert_railway_line_name
    @object.instance_variable_set( :@same_as , @object.same_as.gsub( REGEXP , "ChiyodaBranch" ) )
  end

  def set_refinement_module_to_fundamental_infos
    class << @object.fundamental_infos
      include ::TokyoMetro::Refinement::Api::StationTimetable::Info::Fundamental::List
    end
  end

  def convert_fundamental_infos
    @object.fundamental_infos.convert_railway_lines!( /(?<=\Aodpt\.Railway\:TokyoMetro\.)Chiyoda(?:Branch)?\Z/ , "ChiyodaBranch" )
    @object.fundamental_infos.convert_stations!( /(?<=\Aodpt\.Station\:TokyoMetro\.)Chiyoda(?:Branch)?(?=\.(?:Kita)?Ayase\Z)/ , "ChiyodaBranch" )
  end

end
