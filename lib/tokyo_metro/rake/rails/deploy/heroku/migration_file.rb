class TokyoMetro::Rake::Rails::Deploy::Heroku::MigrationFile < TokyoMetro::Rake::Rails::Deploy::Heroku::FileInfo

  def set_body( schema_file_active_record_definition_body )
    ::File.open( @filename , "w:utf-8" ) do |f|
      f.print( @rows[ 0..( index_where_def_change_begins ) ].join( "\n" ) )
      f.print( "\n" )

      schema_file_active_record_definition_body.each do | row |
        f.print( " " * 2 + row + "\n" )
      end

      f.print( @rows[ ( index_where_active_record_definition_begins )..( @rows.length - 1 ) ].join( "\n" ) )
    end
  end

  private

  def index_where_def_change_begins
    @rows.index { | row | /\A {2}def change\Z/ === row }
  end

  def index_where_active_record_definition_begins
    @rows.index { | row | /\A {2}end\Z/ === row }
  end

end