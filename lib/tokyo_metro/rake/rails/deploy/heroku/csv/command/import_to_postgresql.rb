# PostgreSQL に import する table
class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ImportToPostgresql < TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::MetaClass

  private

  def optional_setting_of_initializer
    @letter_code = "shift_jis"
    @dirname = "#{ ::Rails.root }/db/csv/#{ @time }/#{ @letter_code }"
  end

  # @note 原則は「schema_migrations 以外すべて」
  def tables_names_added_to_db
    tables_without_schema_migrations.map( &:to_s )
  end

  def set_commands_for_db
    @commands << tables_names_added_to_db.map { | table |
      "\\copy #{ table } from \'#{ @dirname }/#{ table }.csv\' CSV ;"
    }
  end

end