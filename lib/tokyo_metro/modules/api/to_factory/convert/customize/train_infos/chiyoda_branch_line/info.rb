module TokyoMetro::Modules::Api::ToFactory::Convert::Customize::TrainInfos::ChiyodaBranchLine::Info

  def initialize( *variables )
    super( *variables )
    convert_infos_of_chiyoda_branch_line
  end

  private

  def convert_infos_of_chiyoda_branch_line
    raise "The method \'#{ __method__ }\' is not defined in this module \'#{ self.class }\'."
  end

end
