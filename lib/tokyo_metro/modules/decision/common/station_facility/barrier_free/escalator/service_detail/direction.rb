# @note
#   The class that includes {::TokyoMetro::Modules::Attributes::Common::StationFacility::BarrierFree::Escalator::ServiceDetail::Direction} should include this module.
# @note
#   The class that includes this module should contain private method 'direction_pattern_info'
module TokyoMetro::Modules::Decision::Common::StationFacility::BarrierFree::Escalator::ServiceDetail::Direction

  # @!group 方向の判定

  def only_up
    direction_pattern_info.up and !( direction_pattern_info.down )
  end

  def only_down
    direction_pattern_info.down and !( direction_pattern_info.up )
  end

  # 両方向にエスカレータが存在するか否か
  # @return [Boolean]
  def both
    direction_pattern_info.up and direction_pattern_info.down
  end

  [ :up , :down , :both ].each do | method_base_name |
    eval <<-DEF
      def #{ method_base_name }?
        direction_pattern_info.#{ method_base_name }
      end

      def not_#{ method_base_name }?
        !( #{ method_base_name }? )
      end

      alias :is_#{ method_base_name }? :#{ method_base_name }?
      alias :is_not_#{ method_base_name }? :not_#{ method_base_name }?
    DEF
  end

  [ :up , :down ].each do | method_base_name |
    eval <<-DEF
      def only_#{ method_base_name }?
        only_#{ method_base_name }
      end

      alias :is_only_#{ method_base_name }? :only_#{ method_base_name }?
    DEF
  end

  alias :has_both_directions? :both?

  # @!endgroup

end
