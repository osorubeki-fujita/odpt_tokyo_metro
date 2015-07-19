module TokyoMetro::Modules::Name::Common::TrainType::ColorBasename

  # @!group CSS に関するメソッド

  def color_basename
    :: TokyoMetro::Factory::Design::TrainType::ColorBasename.process( self )
  end

  # @!endgroup

end
