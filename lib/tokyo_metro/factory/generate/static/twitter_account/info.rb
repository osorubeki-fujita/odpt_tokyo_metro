# Twitter アカウントに関連するインスタンスを作成するための Factory クラス
class TokyoMetro::Factory::Generate::Static::TwitterAccount::Info < TokyoMetro::Factory::Generate::Static::MetaClass::Info::Fundamental

  include ::TokyoMetro::ClassNameLibrary::Static::TwitterAccount

  def self.hash_keys
    [ :widget_id , :account_id , :db_class_of_parent_info ]
  end

  def initialize( h , db_class_of_parent_info )
    @h = h.with_indifferent_access
    @db_class_of_parent_info = db_class_of_parent_info

    @hash_for_making_variables = ::Hash.new.with_indifferent_access
  end

  private

  def set_values_to_hash_for_making_variables
    super( hash_key_array: [ :widget_id , :account_id ] )
    @hash_for_making_variables[ :db_class_of_parent_info ] = @db_class_of_parent_info
  end

end
