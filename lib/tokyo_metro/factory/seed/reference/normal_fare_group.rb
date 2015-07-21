module TokyoMetro::Factory::Seed::Reference::FareNormalGroup

  private

  def normal_group_in_db( whole = nil , search_by: @info.fare_normal_group )
    h = {
      ticket_fare: search_by.ticket_fare #,
      # child_ticket_fare: search_by.child_ticket_fare ,
      # ic_card_fare: search_by.ic_card_fare ,
      # child_ic_card_fare: search_by.child_ic_card_fare
    }
    if whole.present?
      whole.find_by(h)
    else
      ::Fare::NormalGroup.find_by(h)
    end
  end

  def normal_group_id( whole = nil , search_by: @info.fare_normal_group )
    _fare_normal_group_in_db= fare_normal_group_in_db( whole , search_by: search_by )
    raise "Error: \"#{ search_by.same_as }\" does not exist in the database." if _fare_normal_group_in_db.nil?
    _fare_normal_group_in_db.id
  end

end
