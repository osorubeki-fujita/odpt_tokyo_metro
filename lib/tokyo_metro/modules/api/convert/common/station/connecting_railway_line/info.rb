# @note
#   This module is included
#     to {TokyoMetro::Api::Station::Info}
#     by {TokyoMetro::Modules::Api::Convert::Common::Station::ConnectingRailwayLine.set_modules} .
module TokyoMetro::Modules::Api::Convert::Common::Station::ConnectingRailwayLine::Info

  private

  def convert_and_delete_connecting_railway_lines( replacing: nil , ignored: nil )
    if @connecting_railway_lines.present?
      ary = self.class.connecting_railway_line_list_class.new
      @connecting_railway_lines.each do | info |
        ::TokyoMetro::Factory::Convert::Common::Api::Station::RailwayLines.process( info , ary , replacing , ignored , @same_as )
      end
      @connecting_railway_lines = ary
    end
  end

end