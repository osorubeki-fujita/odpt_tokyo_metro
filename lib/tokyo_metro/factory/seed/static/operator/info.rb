class TokyoMetro::Factory::Seed::Static::Operator::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::Operator
  include ::TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  def initialize( info )
    super( info , to_get_id: true )
  end

  private

  def hash_to_db
    h = { name_ja: @info.name_ja_inspect , name_en: @info.name_en_inspect , color: @info.hex_color }

    [
      :same_as ,
      :name_ja_short ,
      # :name_hira ,
      :name_en_short ,
      :index , :operator_code , :numbering , :railway_line_code_shape , :station_code_shape
    ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    h
  end

  def seed_optional_infos
    seed_twitter_account
  end

end
