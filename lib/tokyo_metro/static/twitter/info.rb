class TokyoMetro::Static::Twitter::Info < TokyoMetro::Static::Fundamental::info

  include ::TokyoMetro::ClassNameLibrary::Static::Twitter

  def initialize( widget_id , account_id )
    raise unless widget_id.string? and /\A\d+\Z/ === widget_id

    @widget_id = widget_id
    @account_id = account_id
  end

  attr_reader :widget_id
  attr_reader :account_id

end
