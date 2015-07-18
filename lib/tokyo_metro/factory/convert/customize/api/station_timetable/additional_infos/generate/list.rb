class TokyoMetro::Factory::Convert::Customize::Api::StationTimetable::AdditionalInfos::Generate::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  include ::OdptCommon::Modules::MethodMissing::Constant::Common::ConvertToClassMethod

  [ :ignored_station_timetables , :replacing_infos ].each do | filename |
    const_set( filename.upcase , ::YAML.load_file( "#{::TokyoMetro.dictionary_dir}/additional_infos/customize/station_timetable/#{filename}.yaml" ) )
  end

  include ::TokyoMetro::ClassNameLibrary::Api::StationTimetable


  def process
    delete_ignored_station_timetables
    replacing_infos
  end

  private

  def delete_ignored_station_timetables
    @object.reject! do | item |
      IGNORED_STATION_TIMETABLES.include?( item.same_as )
    end
  end

  def replacing_infos
    @object.each do | item |
      replacing_infos_of_this_station_timetable = REPLACING_INFOS[ item.same_as ]
      if replacing_infos_of_this_station_timetable.present?

        replacing_name = replacing_infos_of_this_station_timetable[ "replacing_name" ]
        if replacing_name.present?
          item.instance_variable_set( :@same_as , replacing_name )
        end

        replacing_fundamental_infos = replacing_infos_of_this_station_timetable[ "replacing_fundamental_infos" ]
        if replacing_fundamental_infos.present?
          new_ary_of_fundamental_infos = self.class.fundamental_list_class.new( replacing_fundamental_infos.map { | info |
            infos_send_to_new_fundamental_info = [ "stations" , "railway_line_infos" , "operators" , "railway_directions" ].map { | key | info[ key ] }
            self.class.fundamental_info_class.new( *infos_send_to_new_fundamental_info )
          } )
          item.instance_variable_set( :@fundamental_infos , new_ary_of_fundamental_infos )
        end

      end
    end
  end

end
