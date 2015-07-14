class TokyoMetro::Factory::Convert::Customize::Api::StationFacility::MarunouchiBranchLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  def process
    if to_convert?
      convert_railway_line_name_of_platform_infos_to_marunouchi_branch_line
    end
  end

  private

  def convert_railway_line_name_of_platform_infos_to_marunouchi_branch_line
    railway_lines = {
      main: ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_same_as ,
      branch: ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.marunouchi_branch_same_as
    }
    @object.platform_infos.each do | platform_info |
      if platform_info.railway_line == railway_lines[ :main ] and platform_info.car_composition == 3
        platform_info.instance_variable_set( :@railway_line , railway_lines[ :branch ] )
      end
    end
  end

  def to_convert?
    list = ::TokyoMetro::Modules::Dictionary::Common::Station::StringList.between_honancho_and_nakano_shimbashi_in_system.map { | sta | "odpt.StationFacility:TokyoMetro.#{ sta }"}
    list.include?( @object.same_as )
  end

end
