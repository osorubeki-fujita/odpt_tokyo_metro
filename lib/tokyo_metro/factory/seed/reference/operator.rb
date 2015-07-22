module TokyoMetro::Factory::Seed::Reference::Operator

  private

  def operator_info_in_db( whole = nil , search_by: @info.operator )
    if whole.present?
      whole.find_by_same_as( search_by )
    else
      ::Operator::Info.find_by_same_as( search_by )
    end
  end

  def operator_info_id( whole = nil , search_by: @info.operator )
    _operator_info_in_db = operator_info_in_db( whole , search_by: search_by )
    raise "Error: \"#{ search_by }\" does not exist in the database." if _operator_info_in_db.nil?
    _operator_info_in_db.id
  end

end
