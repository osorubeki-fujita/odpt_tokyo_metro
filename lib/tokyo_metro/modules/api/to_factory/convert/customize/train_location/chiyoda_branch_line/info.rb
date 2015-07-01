module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainLocation::ChiyodaBranchLine::Info

  private

  def convert_infos_of_chiyoda_branch_line
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainLocation::ChiyodaBranchLine::Info.process( self )
  end

end
