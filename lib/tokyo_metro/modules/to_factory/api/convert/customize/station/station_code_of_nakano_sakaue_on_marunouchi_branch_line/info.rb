module TokyoMetro::Modules::ToFactory::Api::Convert::Customize::Station::StationCodeOfNakanoSakaueOnMarunouchiBranchLine::Info

  def initialize( *variables )
    super( *variables )
    ::TokyoMetro::Factory::Convert::Common::Api::Station::StationCode.process(
      self ,
      ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.nakano_sakaue_on_marunouchi_branch_line ,
      "m06"
    )
  end

end
