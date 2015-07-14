module TokyoMetro::Modules::Decision::Api::StartingStation

  include ::TokyoMetro::Modules::Decision::Common::StartingStation

  private

  def starting?( *args , compared: @starting_station )
    super( *args , compared )
  end

  alias :is_starting? :starting?
  alias :start? :starting?

end
