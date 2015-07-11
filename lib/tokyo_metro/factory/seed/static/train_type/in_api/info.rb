class TokyoMetro::Factory::Seed::Static::TrainType::InApi::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TrainType::InApi

  private

  def hash_to_db
    h = ::Hash.new

    [
      :same_as ,
      :name_ja , :name_ja_short ,
      :name_en , :name_en_short
    ].each do | key_name |
      h[ key_name ] = @info.send( key_name )
    end

    h
  end

end
