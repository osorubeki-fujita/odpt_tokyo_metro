module TokyoMetro::Modules::Decision::Common::SameAs

  def same_as?( *variables )
    compare_base( variables , same_as )
  end

end
