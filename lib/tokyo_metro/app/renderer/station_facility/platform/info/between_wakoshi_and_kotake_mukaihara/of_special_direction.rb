module TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenWakoshiAndKotakeMukaihara::OfSpecialDirection

  def of_special_direction?
    @railway_direction.railway_line_info.yurakucho_line? and @railway_direction.same_as == "odpt.RailwayDirection:TokyoMetro.Yurakucho.ShinKiba"
  end

end
