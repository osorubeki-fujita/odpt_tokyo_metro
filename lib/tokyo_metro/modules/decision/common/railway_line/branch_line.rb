# 支線か否かを判定する機能のモジュール
# @note Rails の model {::Railway::Line::Info} には include しない。
# @todo 書き直し
module TokyoMetro::Modules::Decision::Common::RailwayLine::BranchLine

  def is_branch_railway_line_info?
    /Branch\Z/ === same_as
  end

end
