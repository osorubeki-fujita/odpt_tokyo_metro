module TokyoMetro::Modules::Name::Common::TrainType::CssClass

  # @!group CSS に関するメソッド

  def css_class
    ::TokyoMetro::Factory::Design::TrainType::CssClass.process( self )
  end

  # @!endgroup

end
