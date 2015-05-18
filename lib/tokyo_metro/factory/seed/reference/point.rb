module TokyoMetro::Factory::Seed::Reference::Point

  private

  def point_info_in_db( whole = nil , search_by: @info.point_id_urn )
    if whole.present?
      whole.find_by( id_urn: search_by )
    else
      ::Point::Info.find_by( id_urn: search_by )
    end
  end

  def point_info_id( whole = nil , search_by: @info.point_id_urn )
    _point_info_in_db = point_info_in_db( whole , search_by: search_by )

    if _point_info_in_db.nil?
      raise "Error: \"#{ search_by }\" does not exist in the database."
    end

    _point_info_in_db.id
  end

  alias :exit_in_db :point_info_in_db
  alias :exit_id :point_info_id

end
