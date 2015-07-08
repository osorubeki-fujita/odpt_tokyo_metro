module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::TerminalStation

  def self.set_modules
    ::TokyoMetro::Api::TrainLocation::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::TerminalStation::Info
    end
  end

end
