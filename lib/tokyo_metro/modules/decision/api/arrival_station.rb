module TokyoMetro::Modules::Decision::Api::ArrivalStation

  include ::TokyoMetro::Modules::Decision::Common::ArrivalStation

  private

  def arrival_at?( *args , compared: @arrival_station )
    raise if args.empty?
    super( *args , compared )
  end

  alias :is_arrival_at? :arrival_at?
  alias :arrive_at? :arrival_at?

end
