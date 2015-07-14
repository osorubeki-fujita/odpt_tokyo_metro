# @note
#   The class that includes this method should also include {::TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::Escalator::ServiceDetail::Direction}
module TokyoMetro::Modules::Attributes::Common::StationFacility::BarrierFree::Escalator::ServiceDetail::Direction

# @!group 情報の取得

# 方向の情報を文字列に変換するメソッド
# @return [String]
def to_s
  if both?
    "上り・下り"
  elsif only_up?
    "上り"
  elsif only_down?
    "下り"
  else
    raise "Error"
  end
end

def attribute_info
  if both?
    :both
  elsif only_up?
    :up
  else
    :down
  end
end

def to_a
  [ up? , down? ]
end

def to_h
  { up: up? , down: down? }
end

# @!endgroup

end
