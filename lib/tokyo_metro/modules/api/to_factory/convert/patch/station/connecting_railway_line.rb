module TokyoMetro::Modules::Api::ToFactory::Convert::Patch::Station::ConnectingRailwayLine

  include ::TokyoMetro::Modules::Common::ConvertConstantToClassMethod

  IGNORED_RAILWAY_LINES = ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/additional_infos/patches/station/connecting_railway_line/ignored_railway_lines.yaml" )

  # Method for adding modules to classes.
  # @note
  #   {TokyoMetro::Modules::Api::ToFactory::Convert::Patch::Station::ConnectingRailwayLine::Info} is prepend
  #     to {TokyoMetro::Api::Station::Info} by this method.
  def self.set_modules

    ::TokyoMetro::Api::Station::Info.class_eval do
      prepend ::TokyoMetro::Modules::Api::ToFactory::Convert::Patch::Station::ConnectingRailwayLine::Info
    end

  end

end
