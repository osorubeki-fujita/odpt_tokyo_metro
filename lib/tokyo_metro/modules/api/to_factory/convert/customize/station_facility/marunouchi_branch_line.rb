module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::MarunouchiBranchLine

  def self.set_modules
    ::TokyoMetro::Api::StationFacility::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::StationFacility::MarunouchiBranchLine::Info
    end
  end

end