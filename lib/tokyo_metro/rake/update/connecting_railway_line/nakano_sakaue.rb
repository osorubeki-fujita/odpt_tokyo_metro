class TokyoMetro::Rake::Update::ConnectingRailwayLine::NakanoSakaue

  def initialize( title , number_of_connecting_railway_line_infos_should_be: nil , to_update: false )
    puts title
    @valid_number_of_connecting_railway_line_infos = number_of_connecting_railway_line_infos_should_be
    raise unless @valid_number_of_connecting_railway_line_infos.integer?
    @to_update = to_update

    @station_infos = {
      main: ::Station::Info.find_by( same_as: "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue" ) ,
      branch: ::Station::Info.find_by( same_as: "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue" )
    }
    @railway_lines = {
      main: ::RailwayLine.find_by( same_as: "odpt.Railway:TokyoMetro.Marunouchi" ) ,
      branch: ::RailwayLine.find_by( same_as: "odpt.Railway:TokyoMetro.MarunouchiBranch" )
    }
    @oedo_line = ::RailwayLine.find_by( same_as: "odpt.Railway:Toei.Oedo" )
  end

  def update_connecting_railway_line
    check_railway_lines

    @station_infos.each do | k , station_info |
      raise "Error: #{ k }" unless station_info.present?
      raise "Error: #{ k }" unless station_info.connecting_railway_line_infos.length == @valid_number_of_connecting_railway_line_infos
      c_oedo = station_info.connecting_railway_line_infos.find_by( railway_line_id: @oedo_line.id )
      raise "Error #{k}" unless c_oedo.present?
      puts "Update connecting railway line info to Oedo Line: #{k}"
      if @to_update and c_oedo.index_in_station == 2
        c_oedo.update( index_in_station: 2 )
      end
    end
  end

  def create_connecting_railway_line_info
    hashes_for_creating_connecting_railway_line_infos.each do |h|
      h_for_create = h.merge({
        index_in_station: 1 ,
        connecting_to_another_station: false ,
        cleared: false ,
        not_recommended: false ,
        note_id: nil ,
        hidden_on_railway_line_page: true ,
        start_on: nil ,
        end_on: nil ,
        id: ::ConnectingRailwayLine::Info.all.pluck( :id ).max + 1
      })
      puts h_for_create
      ::ConnectingRailwayLine::Info.create( h_for_create )
    end
  end

  def self.update_connecting_railway_line( title , number_of_connecting_railway_line_infos_should_be: nil , to_update: false )
    valid_number_of_connecting_railway_line_infos = number_of_connecting_railway_line_infos_should_be
    self.new( title , number_of_connecting_railway_line_infos_should_be: valid_number_of_connecting_railway_line_infos , to_update: to_update ).update_connecting_railway_line
  end

  private

  def check_railway_lines
    @railway_lines.each do | k , railway_line |
      raise "Error: #{ k }" unless railway_line.present?
    end
  end

  def hashes_for_creating_connecting_railway_line_infos
    [
      { station_info_id: @station_infos[ :main ].id , railway_line_id: @railway_lines[ :branch ].id , connecting_station_info_id: @station_infos[ :branch ].id } ,
      { station_info_id: @station_infos[ :branch ].id , railway_line_id: @railway_lines[ :main ].id , connecting_station_info_id: @station_infos[ :main ].id }
    ]
  end

end
