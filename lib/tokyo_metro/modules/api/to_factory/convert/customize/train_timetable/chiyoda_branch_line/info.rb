module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainTimetable::ChiyodaBranchLine::Info

  private

  def convert_infos_of_chiyoda_branch_line
    ::TokyoMetro::Factory::Convert::Customize::Api::TrainTimetable::ChiyodaBranchLine::Info.process( self )
  end

end
