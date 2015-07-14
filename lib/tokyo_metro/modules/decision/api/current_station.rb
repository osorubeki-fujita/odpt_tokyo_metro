module TokyoMetro::Modules::Decision::Api::CurrentStation

  include ::TokyoMetro::Modules::Decision::MetaClass::CurrentStation

  private

  def station_same_as__is_in?( *args , compared: @station )
    raise if args.empty?
    super( *args , compared )
  end

end
