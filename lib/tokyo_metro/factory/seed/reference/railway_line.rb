module TokyoMetro::Factory::Seed::Reference::RailwayLine

  private

  def railway_line_info_in_db( whole = nil , search_by: @info.railway_line_info )
    if whole.present?
      whole.find_by( same_as: search_by )
    else
      ::Railway::Line.find_by( same_as: search_by )
    end
  end

  def railway_line_info_id( whole = nil , search_by: @info.railway_line_info )
    _railway_line_info_in_db = railway_line_info_in_db( whole , search_by: search_by )
    raise "Error: \"#{ search_by }\" does not exist in the database." if _railway_line_info_in_db.nil?
    _railway_line_info_in_db.id
  end

end
