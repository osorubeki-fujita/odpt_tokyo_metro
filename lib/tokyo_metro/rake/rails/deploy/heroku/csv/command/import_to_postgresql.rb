# PostgreSQL に import する table
class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ImportToPostgresql < TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::MetaClass

  private

  # @note 原則は「schema_migrations 以外すべて」
  def tables_names_added_to_db
    tables_without_schema_migrations.map( &:to_s )
  end

  def set_commands_for_db
    tables_names_added_to_db.map { | table |
      "\\copy #{ table } from \'\./../rails_tokyo_metro_db/csv/#{ @time }/shift_jis/#{ table }.csv\' CSV ;"
    }
  end

end