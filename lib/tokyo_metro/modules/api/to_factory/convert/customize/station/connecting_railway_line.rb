module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine

  # Method for adding modules to classes.
  # @note
  #   {TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Info} is prepend
  #     to {TokyoMetro::Api::Station::Info} by this method.
  # @note
  #   {TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Info::ConnectingRailwayLine::Info} is prepend
  #     to {TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info} by this method.
  # @note
  #   {TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Factory::Seed::Info::ConnectingRailwayLine::Info} is prepend
  #     to {TokyoMetro::Factory::Seed::Api::Station::Info::ConnectingRailwayLine::Info} by this method.
  def self.set_modules

    ::TokyoMetro::Api::Station::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Info
    end

    ::TokyoMetro::Api::Station::Info::ConnectingRailwayLine::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Info::ConnectingRailwayLine::Info
    end

    ::TokyoMetro::Factory::Seed::Api::Station::Info::ConnectingRailwayLine::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Customize::Station::ConnectingRailwayLine::Factory::Seed::Info::ConnectingRailwayLine::Info
    end

  end

end
