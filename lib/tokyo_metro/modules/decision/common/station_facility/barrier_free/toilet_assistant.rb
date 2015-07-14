module TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::ToiletAssistant

  def facility_for_ostomate
    ostomate
  end

  # 幼児用の設備があるか否かを判定するメソッド
  # @return [Boolean]
  def facility_for_baby
    baby_chair or baby_changing_table
  end

  [ :baby_chair , :baby_changing_table , :facility_for_ostomate , :facility_for_baby ].each do | instance_variable_name |
    eval <<-DEF
      def has_#{ instance_variable_name }?
        #{ instance_variable_name }
      end

      def #{ instance_variable_name }_available?
        #{ instance_variable_name }
      end
    DEF
  end

  [ :ostomate , :baby ].each do | instance_variable_base_name |
    [ "for_#{ instance_variable_base_name }?" , "available_to_#{ instance_variable_base_name }?" ].each do | method_name |
      eval <<-DEF
        def #{ method_name }
          facility_for_#{ instance_variable_base_name }
        end
      DEF
    end
  end

end
