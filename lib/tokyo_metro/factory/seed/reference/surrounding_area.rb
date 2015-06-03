module TokyoMetro::Factory::Seed::Reference::SurroundingArea

  private

  def surrounding_area_in_db( search_by: @info.name_ja )
    ::SurroundingArea.find_or_create_by( name_ja: search_by )
  end

  def surrounding_area_id( search_by: @info.name_ja )
    surrounding_area_in_db( search_by: search_by ).id
  end

end
