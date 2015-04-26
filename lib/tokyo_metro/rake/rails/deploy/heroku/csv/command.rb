module TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command

  def self.to_import_to_sqlite( time )
    ::TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ImportToSqlite.new( time ).to_s
  end

  def self.to_export_from_sqlite( time = nil )
    ::TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ExportFromSqlite.new( time ).to_s
  end

  def self.to_import_to_postgresql( time )
    ::TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ImportToPostgresql.new( time ).to_s
  end

end