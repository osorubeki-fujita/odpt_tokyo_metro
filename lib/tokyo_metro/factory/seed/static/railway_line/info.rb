# @note 運行事業者名（インスタンス変数 operator）が東京メトロの場合は、{TokyoMetro::Api::RailwayLine::Info} の情報も同時に流し込む。
class TokyoMetro::Factory::Seed::Static::RailwayLine::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::RailwayLine
  include ::TokyoMetro::Factory::Seed::Reference::Operator
  include ::TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  def initialize( info )
    super( info , to_get_id: true )
  end

  private

  def hash_to_db
    h = ::Hash.new

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

  def codes
    if @info.has_code_infos?
      @info.codes.join( "/" )
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

  def seed_optional_infos
    seed_twitter_account
    seed_additional_infos_in_api
    seed_codes
  end

  def seed_additional_infos_in_api
    self.class.factory_for_seeding_additional_infos_in_api.new( @info , @id )
  end

  def seed_codes
    self.class.factory_for_seeding_code_infos.new( @info , @id )
  end

end
