class TokyoMetro::Factory::Seed::Static::Operator::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::Operator
  include ::TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  def initialize( info )
    super( info , to_get_id: true )
  end

  private

  def hash_to_db
    h = { name_ja: @info.name_ja_inspect , name_hira: @info.name_hira_inspect , name_en: @info.name_en_inspect }

    [
      :same_as ,
      :name_ja_short ,
      :name_hira_short ,
      :name_en_short ,
      :index
    ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    h
  end

  def seed_optional_infos
    seed_twitter_account_info
    seed_code
  end

  private

  def seed_code
    @info.additional_infos.seed( @id )
  end

end
