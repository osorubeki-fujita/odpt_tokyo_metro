class TokyoMetro::Static::TwitterAccount::Info < TokyoMetro::Static::Fundamental::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TwitterAccount

  def initialize( widget_id , account_id , type , db_class_of_parent_info )
    raise unless widget_id.string? and /\A\d+\Z/ === widget_id

    @widget_id = widget_id
    @account_id = account_id

    @db_class_of_parent_info = db_class_of_parent_info
  end

  attr_reader :widget_id
  attr_reader :account_id

  attr_reader :db_class_of_parent_info

end
