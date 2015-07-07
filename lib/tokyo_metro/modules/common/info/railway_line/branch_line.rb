# 支線か否かを判定する機能のモジュール
# @note Rails の model {::RailwayLine} では、column 'is_branch_railway_line' の値を用いて判定したいため、諸々の機能を持つ {TokyoMetro::Modules::Common::Info::RailwayLine} のみを include し、branch_railway_line? などは method_missing で対応する。
module TokyoMetro::Modules::Common::Info::RailwayLine::BranchLine

  def branch_railway_line?
    /Branch\Z/ === same_as
  end

  alias :is_branch_railway_line :branch_railway_line?
  alias :is_branch_railway_line? :branch_railway_line?

end
