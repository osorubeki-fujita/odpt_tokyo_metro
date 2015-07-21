class TokyoMetro::Rake::Rails::Update::ConnectingRailwayLine::NakanoSakaue

  def initialize( title , number_of_connecting_railway_line_infos_should_be: nil , to_update: false )
    puts "* #{ title }"
    puts ""
    @valid_number_of_connecting_railway_line_infos = number_of_connecting_railway_line_infos_should_be
    unless @valid_number_of_connecting_railway_line_infos.integer?
      raise "valid number of connecting railway line infos should be integer."
    end
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
      unless station_info.present?
        raise "Station info on #{k} line is not present."
      end
      unless station_info.connecting_railway_line_infos.length == @valid_number_of_connecting_railway_line_infos
        l = station_info.connecting_railway_line_infos.length
        v = @valid_number_of_connecting_railway_line_infos
        raise "The number of connecting railway line infos of station on #{k} line is not valid. (Now: #{l} / Valid: #{v})"
      end

      c_oedo = station_info.connecting_railway_line_infos.find_by( railway_line_info_id: @oedo_line.id )

      unless c_oedo.present?
        raise "Station info on #{k} line does not have connecting railway line info to Toei Oedo Line."
      end

      puts "Update connecting railway line info to Oedo Line: #{k}"

      if @to_update
        unless c_oedo.index_in_station == 2
          c_oedo.update( index_in_station: 2 )
          puts " " * 4 + "Complete - update"
        else
          puts " " * 4 + "You need not to update"
        end
      end
      puts ""

    end

  end

  def create_connecting_railway_line_info
    fundamental_hashes_for_finding_connecting_railway_line_infos.each do |h|
      puts "Create new connecting railway line info"

      h_for_finding = h.merge({
        index_in_station: 1 ,
        connecting_to_another_station: false ,
        cleared: false ,
        not_recommended: false ,
        note_id: nil ,
        hidden_on_railway_line_page: true ,
        start_on: nil ,
        end_on: nil
      })

      puts " " *4 + h_for_finding.to_s
      info_already_created = ::ConnectingRailwayLine::Info.find_by( h_for_finding )
      unless info_already_created.present?
        h_for_creating = h_for_finding.merge({
          id: ::ConnectingRailwayLine::Info.all.pluck( :id ).max + 1
        })
        puts " " *4 + "Create new info.\n#{ h_for_creating.to_s }"
        ::ConnectingRailwayLine::Info.create( h_for_creating )
        puts " " *4 + "Complete - create new info"
      else
        puts " " *4 + "You need not to create new info.\n#{ h_for_finding.to_s }"
      end
      puts ""

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

  def fundamental_hashes_for_finding_connecting_railway_line_infos
    [
      { station_info_id: @station_infos[ :main ].id , railway_line_info_id: @railway_lines[ :branch ].id , connecting_station_info_id: @station_infos[ :branch ].id } ,
      { station_info_id: @station_infos[ :branch ].id , railway_line_info_id: @railway_lines[ :main ].id , connecting_station_info_id: @station_infos[ :main ].id }
    ]
  end

end
