# SQLite に import する table
class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ImportToSqlite < TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::MetaClass

  private
  
  def optional_setting_of_initializer
    @letter_code = "utf8"
    # @dirname = ".import ./../rails_tokyo_metro_db/csv/#{ @time }/#{ @letter_code }/#{ table }.csv #{ table }"
    @dirname = "#{ ::Rails.root }/db/csv/#{ @time }/#{ @letter_code }"
  end

  def first_settings
    ".separator ,"
  end

  def tables_names_added_to_db
    #   「schema_migrations 以外の table のうち、# で始まるもの」
    # tables_without_schema_migrations.select( &:begin_with_sharp? ).map( &:to_s )
    #   「schema_migrations 以外の table から、# で始まるものを取り除いたもの」
    tables_without_schema_migrations.delete_if( &:begin_with_sharp? ).map( &:to_s )
  end

  def set_commands_for_db
    @commands << tables_names_added_to_db.map { | table |
      ".import #{ @dirname }/#{ table }.csv #{ table }"
    }
  end

end