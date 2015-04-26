# SQLite から export する table
class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::ExportFromSqlite < TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::MetaClass
  
  private
  
  def set_time( time )
    super( time , require_time: false )
  end
  
  def first_settings
    [ ".mode csv" , ".header OFF" ]
  end
  
  # @note 「schema_migrations 以外の table から、# で始まるものを取り除いたもの」
  def tables_names_added_to_db
    tables_without_schema_migrations.delete_if( &:begin_with_sharp? ).map( &:to_s )
  end
  
  def set_commands_for_db
    tables_names_added_to_db.map { | table |
      [
        ".output ./../rails_tokyo_metro_db/csv/#{ @time }/utf8/#{ table }.csv" ,
        "select * from #{ table };"
      ]
    }
  end

end