class TokyoMetro::Factory::Design::RailwayLine::CssClass < OdptCommon::Factory::Design::RailwayLine::CssClass

  def to_s
    str = super()

    if @object.marunouchi_branch_line? or @object.chiyoda_branch_line?
      raise unless @num == 0
      str = str.gsub( /\Atokyo_metro_/ , "" )
    end

    return str
  end

end
