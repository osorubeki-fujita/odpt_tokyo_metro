class TokyoMetro::Rake::Debug::StationFacility

  def initialize( title , facilities , category )
    puts title
    @h = ::Hash.new
    @facilities = facilities
    @category = category
    set_procs
    sleep(1)
    set_http_client
    load_datum_from_api
  end

  def process
    @facilities.each do | station , facility_names |
      facility_list = [ facility_names ].flatten
      facility_list.each do | facility_name |
        puts "-" * 4
        puts ""
        inspect_each_facility( station , facility_name )
      end
    end
  end

  private
  
  def set_procs
    case @category
    when :barrier_free_facilities
      @procs = {
        json: {
          key: "odpt:barrierfreeFacility" ,
          proc: ::Proc.new { | list , facility_name |
            list.find { | item |
              item[ "owl:sameAs" ] == facility_name
            }
          }
        } ,
        instance: {
          method: :barrier_free_facilities ,
          proc: ::Proc.new { | list , facility_name |
            list.find { | item |
              item.same_as == facility_name
            }
          }
        }
      }
    end
  end

  def set_http_client
    @http_client = ::HTTPClient.new
    [ :connect_timeout , :send_timeout , :receive_timeout ].each do | timeout_type |
      @http_client.send( "#{ timeout_type }=" , 300 )
    end
    sleep(10)
  end

  def load_datum_from_api
    @facilities.keys.each do | sta |
      unless @h[ sta ].present?
        @h[ sta ] = ::Hash.new
      end
      @h[ sta ][ :json ] = ::TokyoMetro::Api::StationFacility.get( http_client , same_as: "odpt.stationFacility:TokyoMetro.#{ sta.capitalize }" , perse_json: true ).first
      sleep(1)
      @h[ sta ][ :instance ] = ::TokyoMetro::Api::StationFacility.get( http_client , same_as: "odpt.stationFacility:TokyoMetro.#{ sta.capitalize }" , perse_json: true , generate_instance: true ).first
      sleep(1)
    end
  end
  
  def inspect_each_facility( station , facility_name )
    proc_for_json = @proc[ :json ][ :proc ]
    list_from_json = @h[ station ][ :json ][ @procs[ :json ][ :key ] ]

    proc_for_instance = @proc[ :instance ][ :proc ]
    list_from_instance = @h[ station ][ :instance ].send( @proc[ :instance ][ :method ] )

    puts proc_for_json.call( list_from_json , facility_name ).inspect
    puts ""
    puts proc_for_instance.call( list_from_instance , facility_name ).inspect
    puts ""
  end

  def self.process( title , facilities , category )
    self.new( title , facilities , category )
  end

end
