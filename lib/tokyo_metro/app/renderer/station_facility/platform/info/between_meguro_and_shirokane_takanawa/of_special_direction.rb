module TokyoMetro::App::Renderer::StationFacility::Platform::Info::BetweenMeguroAndShirokaneTakanawa::OfSpecialDirection

  def of_special_direction?
    @railway_direction.railway_line_info.namboku_line? and @railway_direction.same_as == "odpt.RailwayDirection:TokyoMetro.Namboku.AkabaneIwabuchi"
  end

end
