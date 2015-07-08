class TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  include ::TokyoMetro::ClassNameLibrary::Api::Station

  def initialize( object , replacing , ignored )
    super( object )
    @replacing = replacing
    @ignored = ignored

    # puts self.class
    # puts "replacing: #{ replacing.class }"
    # puts "ignored: #{ ignored.class }"
    # puts ""
  end

  def process
    if to_process?
      convert_connecting_railway_line_infos
    end
  end

  private

  def to_process?
    @object.connecting_railway_lines.present?
  end

  def convert_connecting_railway_line_infos
    ary = self.class.connecting_railway_line_list_class.new
    @object.connecting_railway_lines.each do | info |
      ::TokyoMetro::Factory::Convert::Common::Api::Station::ConnectingRailwayLine::Info::ConnectingRailwayLine::Info.process( info , ary , @replacing , @ignored , @object.same_as )
    end
    @object.instance_variable_set( :@connecting_railway_lines , ary )
  end

end
