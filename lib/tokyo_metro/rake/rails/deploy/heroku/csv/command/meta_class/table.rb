class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::MetaClass::Table

  def initialize( table )
    @table = table
  end

  def schema_migrations?
    /\A\#{2} \[Schema migrations\] / =~ @table
  end
  
  def begin_with_sharp?
    /\A\#/ === @table
  end
  
  def to_s
    @table.gsub( /\A\#\s+/ , "" )
  end

end