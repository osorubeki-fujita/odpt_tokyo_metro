module TokyoMetro::Modules::ToFactory::Api::Convert::Patch::Station::ConnectingRailwayLine

  # Method for adding modules to classes.
  # @note
  #   {TokyoMetro::Modules::ToFactory::Api::Convert::Patch::Station::ConnectingRailwayLine::Info} is prepend
  #     to {TokyoMetro::Api::Station::Info} by this method.
  def self.set_modules
    ::TokyoMetro::Api::Station::Info.class_eval do
      prepend ::TokyoMetro::Modules::ToFactory::Api::Convert::Patch::Station::ConnectingRailwayLine::Info
    end

  end

end
