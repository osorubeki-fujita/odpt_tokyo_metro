module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::StationCodeOfNakanoSakaueOnMarunouchiBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Common::Api::Station::StationCode.process( self , "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue" , "m06" )
  end

end
