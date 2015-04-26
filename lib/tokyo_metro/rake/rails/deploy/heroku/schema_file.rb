class TokyoMetro::Rake::Rails::Deploy::Heroku::SchemaFile < TokyoMetro::Rake::Rails::Deploy::Heroku::FileInfo

  def active_record_definition_body
    @rows[ ( index_where_active_record_definition_begins + 1 )..( index_where_active_record_definition_ends ) ]
  end

  private

  def index_where_active_record_definition_begins
    @rows.index { | row | /\AActiveRecord::Schema\.define\(version: \d{14}\) do/ === row }
  end

  def index_where_active_record_definition_ends
    ( @rows.length - 1 ) - 1
  end

end