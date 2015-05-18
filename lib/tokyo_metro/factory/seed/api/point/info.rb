class TokyoMetro::Factory::Seed::Api::Point::Info < TokyoMetro::Factory::Seed::Api::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Api::Point
  include ::TokyoMetro::Factory::Seed::Api::Point::Common

  include ::TokyoMetro::Factory::Seed::Reference::Station

  private

  def hash_to_db
    h = ::Hash.new

    [ :id_urn , :code , :additional_info_ja , :additional_info_en , :latitude , :longitude , :geo_json , :floor ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    [ :station_facility_id , :category_id ].each do | key_name |
      h[ key_name ] = self.send( key_name )
    end

    h[ :elevator ] = @info.has_elevator?
    h[ :closed ] = @info.closed?

    h
  end

  def station_in_db
    _station_name_ja = @info.station_name_in_title.process_machine_dependent_character
    _station_in_db = @station_infos.find_by( name_ja: _station_name_ja )

    if _station_in_db.nil?
      raise "Error: The station information of \"#{ _station_name_ja }\" does not exist in the db."
    end

    _station_in_db
  end

  def station_facility_id
    station_in_db.station_facility_id
  end

  def category_in_db
    self.class.db_category_class.find_or_create_by( name_ja: category_name_ja , name_en: category_name_en )
  end

  def category_id
    category_in_db.id
  end

  [ :ja , :en ].each do | lang |
    eval <<-DEF
      def category_name_#{ lang }
        str = @info.category_name_#{ lang }
        unless str.present?
          raise "Error: The category name (#{ lang }) of \"" + @info.title.to_s + "\" is not valid. The category info is not defied."
        end
        str
      end
    DEF
  end

end
