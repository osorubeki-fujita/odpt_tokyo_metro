module TokyoMetro::Modules::Common::Info::Operator::Info

  def tokyo_metro?
    same_as == "odpt.Operator:TokyoMetro"
  end

  def not_tokyo_metro?
    !( tokyo_metro? )
  end

end
