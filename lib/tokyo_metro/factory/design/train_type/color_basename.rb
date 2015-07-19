class TokyoMetro::Factory::Design::TrainType::ColorBasename < OdptCommon::Factory::Design::TrainType::ColorBasename

  def initialize( object )
    super( object , /\ATokyoMetro\./ )
  end

end
