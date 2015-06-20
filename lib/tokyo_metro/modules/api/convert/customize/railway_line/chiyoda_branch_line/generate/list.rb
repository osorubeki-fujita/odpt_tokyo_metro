module TokyoMetro::Modules::Api::Convert::Customize::RailwayLine::ChiyodaBranchLine::Generate::List

  def generate( max = nil )
    ary = super( max )
    process_chiyoda_main_line_and_add_chiyoda_branch_line( ary )
    return ary
  end

  private

  def process_chiyoda_main_line_and_add_chiyoda_branch_line( ary )
    ::TokyoMetro::Factory::Convert::Customize::Api::RailwayLine::ChiyodaBranchLine::Generate::List.process( ary )
  end

end
