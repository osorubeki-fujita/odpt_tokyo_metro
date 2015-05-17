module TokyoMetro::Modules::Common::Info::NewAndOldRailwayLine

  def not_operated_yet?
    start_on.present? and ::Time.now < start_on
  end

  def operated_already?
    !( not_operated_yet? )
  end

  def already_operated?
    operated_already?
  end

  def ended_already?
    end_on.present? and ::Time.now > end_on
  end

  def already_ended?
    ended_already?
  end

  def not_ended_yet?
    !( ended_already? )
  end

  def not_operated_now?
    !( not_operated_yet? or ended_already? )
  end

  [
    :not_operated_yet , :operated_already , :already_operated ,
    :ended_already , :already_ended , :not_ended_yet ,
    :not_operated_now
  ].each do | method_base_name |
    [ "is_#{ method_base_name }" , "is_#{ method_base_name }?" ].each do | method_name |
      eval <<-ALIAS
        def #{ method_name }
          #{ method_base_name }?
        end
      ALIAS
    end
  end

end