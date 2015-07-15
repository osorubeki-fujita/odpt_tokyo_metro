module TokyoMetro::Modules::Decision::Api::Station::Current

  include ::TokyoMetro::Modules::Decision::Common::Station::Current

  private

  def station_same_as__is_in?( *args , compared: @station )
    raise if args.empty?
    super( *args , compared )
  end

end
