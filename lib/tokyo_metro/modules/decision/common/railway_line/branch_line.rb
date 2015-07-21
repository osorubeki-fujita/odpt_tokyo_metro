# 支線か否かを判定する機能のモジュール
# @note 【todo 書き直し】Rails の model {::Railway::Line::Info} では、column 'is_branch_railway_line' の値を用いて判定したいため、諸々の機能を持つ {TokyoMetro::Modules::Name::Common::RailwayLine::CssClass} のみを include し、branch_railway_line? などは {OdptCommon::Modules::MethodMissing::Decision::Common::RailwayLine::BranchLine} で対応する。
module TokyoMetro::Modules::Decision::Common::RailwayLine::BranchLine

  def branch_railway_line?
    /Branch\Z/ === same_as
  end

  alias :is_branch_railway_line :branch_railway_line?
  alias :is_branch_railway_line? :branch_railway_line?

end
