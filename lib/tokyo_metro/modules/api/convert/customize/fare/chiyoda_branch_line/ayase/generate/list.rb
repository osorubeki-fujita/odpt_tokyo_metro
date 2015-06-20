module TokyoMetro::Modules::Api::Convert::Customize::Fare::ChiyodaBranchLine::Ayase::Generate::List

  def generate( max = nil )
    ary = super( max )

    fares_from_ayase = ary.select { | item | item.from_station == "odpt.Station:TokyoMetro.Chiyoda.Ayase" }
    fares_to_ayase = ary.select { | item | item.to_station == "odpt.Station:TokyoMetro.Chiyoda.Ayase" }

    fares_from_ayase.each do | item |
      ary << fare_info_from_ayase_chiyoda_branch( item )
    end

    fares_to_ayase.each do | item |
      ary << fare_info_to_ayase_chiyoda_branch( item )
    end

    return ary
  end

  private

  def fare_info_from_ayase_chiyoda_branch( item )
    fare_info_from_or_to_ayase_chiyoda_branch( item , :from_station )
  end

  def fare_info_to_ayase_chiyoda_branch( item )
    fare_info_from_or_to_ayase_chiyoda_branch( item , :to_station )
  end

  def fare_info_from_or_to_ayase_chiyoda_branch( item , condition )
    ::TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::Ayase::Generate::List.process( item , condition )
  end

end
