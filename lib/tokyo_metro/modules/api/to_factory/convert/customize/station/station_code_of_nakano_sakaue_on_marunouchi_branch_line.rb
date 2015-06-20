module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::StationCodeOfNakanoSakaueOnMarunouchiBranchLine

  def self.set_modules
    ::TokyoMetro::Api::Station::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::StationCodeOfNakanoSakaueOnMarunouchiBranchLine::Info
    end
  end

end