class TokyoMetro::Factory::Design::RailwayLine::CssClass < OdptCommon::Factory::Design::RailwayLine::CssClass

  def to_s
    str = super()
    if marunouchi_branch_line? or chiyoda_branch_line?
      str.gsub( /Atokyo_metro_/ , "" )
    elsif
      str
    end
  end

end
