class TokyoMetro::Factory::Seed::Api::Station::Info < TokyoMetro::Factory::Seed::Api::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Api::Station
  include ::TokyoMetro::Factory::Seed::Api::Station::Common

  include ::TokyoMetro::Factory::Seed::Reference::Operator
  include ::TokyoMetro::Factory::Seed::Reference::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::StationFacility
  include ::TokyoMetro::Factory::Seed::Reference::DcDate

  private

  def hash_to_db
    h = ::Hash.new

    [ :id_urn , :same_as , :name_ja , :station_code , :longitude , :latitude , :geojson ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    [ :dc_date , :operator_info_id , :railway_line_info_id , :station_facility_info_id ].each do | key_name |
      h[ key_name ] = self.send( key_name )
    end

    h
  end

  def operator_info_id
    super( @operator_infos )
  end

  def railway_line_info_id
    super( @railway_lines )
  end

  def station_facility_info_id
    super( @station_facility_infos )
  end

end
