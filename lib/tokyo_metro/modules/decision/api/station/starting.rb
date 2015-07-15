module TokyoMetro::Modules::Decision::Api::Station::Starting

  include ::TokyoMetro::Modules::Decision::Common::Station::Starting

  private

  def starting?( *args , compared: @starting_station )
    super( *args , compared )
  end

  alias :is_starting? :starting?
  alias :start? :starting?

end
