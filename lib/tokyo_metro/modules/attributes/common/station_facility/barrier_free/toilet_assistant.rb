module TokyoMetro::Modules::Attributes::Common::StationFacility::BarrierFree::ToiletAssistant

  def to_a
    ary = ::Array.new
    if wheel_chair_accessible?
      ary << "車いす対応"
    end
    if has_baby_chair?
      ary << "乳幼児用いす"
    end
    if has_baby_changing_table?
      ary << "おむつ交換台"
    end
    if has_facility_for_ostomate?
      ary << "オストメイト対応設備"
    end
    ary
  end

  def to_s
    to_a.join("／")
  end

  def to_h
    h = ::Hash.new
    [ :wheel_chair_accessible , :baby_chair , :baby_changing_table , :ostomate ].each do | key_name |
      h[ key_name ] = self.send( key_name )
    end
    h
  end

end
