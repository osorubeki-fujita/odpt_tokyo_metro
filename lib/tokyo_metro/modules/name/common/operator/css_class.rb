module TokyoMetro::Modules::Name::Common::Operator::CssClass

  # CSS のクラスの名称
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.css_class }
  #   =>
  #   tokyo_metro
  #   toei_subway
  #   toei
  #   toden
  #   jr_east
  #   jr_central
  #   tokyu
  #   yokohama_minatomirai
  #   odakyu
  #   hakone_tozan
  #   seibu
  #   tobu
  #   saitama
  #   toyo_rapid
  #   keio
  #   keisei
  #   tsukuba_exp
  #   yurikamome
  #   rinkai
  def css_class
    ::TokyoMetro::Factory::Design::Operator::CssClass.process( self )
  end

end
