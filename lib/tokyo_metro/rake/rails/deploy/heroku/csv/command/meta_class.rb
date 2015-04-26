class TokyoMetro::Rake::Rails::Deploy::Heroku::Csv::Command::MetaClass

  def initialize( time = nil )
    @tables = open( "#{ ::Rails.root }/db/csv/tables.txt" , "r:utf-8" ).read.split( /\n/ ).map { | table | Table.new( table ) }
    @commands = ::String.new
    set_time( time )
  end

  attr_reader :time

  def to_s
    set_first_settings_to_s
    set_commands_for_db

    @commands.flatten
  end

  private

  def set_time( time , require_time: true )
    if time.present?
      raise "Error" unless /\A\d{14}\Z/ === time or /\A\d{8}_\d{6}\Z/ === time
      @time = time.gsub( "_" , "" )
    elsif require_time
      raise "Error: The variable \#1 \'time\' is not defined."
    else
      @time = ::Time.now.strftime( "%Y%m%d%H%M%S" )
    end
  end

  def first_settings
    nil
  end

  def tables_without_schema_migrations
    @tables.delete_if( &:schema_migrations? )
  end

  def set_first_settings_to_s
    if first_settings.present?
      @commands << [ first_settings ].flatten
    end
  end

  def tables_names_added_to_db
    raise "Error: This method \'#{ __method__ }\' is not defined yet in this class \'#{ self.class.name }\'."
  end

  def set_commands_for_db
    raise "Error: This method \'#{ __method__ }\' is not defined yet in this class \'#{ self.class.name }\'."
  end

end