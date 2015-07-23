# @note 運行事業者名（インスタンス変数 operator）が東京メトロの場合は、{TokyoMetro::Api::RailwayLine::Info} の情報も同時に流し込む。
class TokyoMetro::Factory::Seed::Static::RailwayLine::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::Operator
  include ::TokyoMetro::Factory::Seed::Reference::DcDate
  include ::TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  def initialize( info )
    super( info , get_id: true )

    @id_urn = nil
    @geo_json = nil
    @dc_date = nil

    set_variables_of_railway_lines_operated_by_the_app_operator
  end

  private

  def set_variables_of_railway_lines_operated_by_the_app_operator
    if @info.operated_by_tokyo_metro?
      railway_line_info_in_api = ::TokyoMetro::Api.railway_lines.find{ | railway_line | railway_line.same_as?( @info.same_as ) }

      [ :id_urn , :geo_json , :dc_date ].each do | method_name |
        eval <<-DEF
          @#{ method_name } = railway_line_info_in_api.#{ method_name }
        DEF
      end

    end
  end

  def hash_to_db
    h = {
      color: @info.color_normal_web ,
      name_codes: name_codes ,
      #
      id_urn: @id_urn ,
      geo_json: @geo_json ,
      dc_date: dc_date
    }

    [ :name_ja , :name_hira , :name_en , :operator_info_id ].each do | key_name |
      h[ key_name ] = send( key_name )
    end

    [
      :same_as ,
      :index_in_operator , :start_on , :end_on # , :twitter_widget_id , :twitter_account_name
    ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    h
  end

  def name_codes
    if @info.has_name_codes?
      @info.name_codes.join( "/" )
    else
      nil
    end
  end

  [ :name_ja , :name_hira , :name_en ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @info.#{ method_name }_inspect
      end
    DEF
  end

  [ :operator_info_in_db , :operator_info_id ].each do | method_name |
    eval <<-DEF
      def #{ method_name }( whole = nil , search_by: @info.operator.same_as )
        super( whole , search_by: search_by )
      end
    DEF
  end

  def dc_date
    if @dc_date.present?
      super( create_from: @dc_date )
    else
      nil
    end
  end

  def seed_optional_infos
    seed_twitter_account
  end

end
