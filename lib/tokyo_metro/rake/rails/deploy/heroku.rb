module TokyoMetro::Rake::Rails::Deploy::Heroku

  def self.process_migration_files
    if migrate_files_except_for_heroku_initializer.present?
      ::Rake::Task[ "db:migrate" ].invoke
    end
  end

  def self.move_migration_files_to_old_dir
    move_migration_files( to_old_dir: true , to_heroku_old_dir: true )
  end

  def self.make_migration_file
    system( "rails g migration HerokuInitializer" )

    raise "Error" unless ::File.exist?( schema_file )
    raise "Error" unless migrate_files.length == 1

    schema_file_active_record_definition_body = SchemaFile.new( schema_file ).active_record_definition_body
    # puts schema_file_active_record_definition_body

    MigrationFile.new( migrate_files.first ).set_body( schema_file_active_record_definition_body )
  end

  def self.move_heroku_migration_files_to_old_dir
    move_migration_files( to_heroku_old_dir: true )
  end

  class << self

    def migrate_files
      ::Dir.glob( "#{ ::Rails.root }/db/migrate/**.rb" )
    end

    def migrate_files_except_for_heroku_initializer
      migrate_files.delete_if { | filename | /heroku_initializer\.rb\Z/ === filename }
    end

    def migrate_old_files
      ::Dir.glob( "#{ ::Rails.root }/db/migrate_old/**.rb" )
    end

    def schema_file
      "#{ ::Rails.root }/db/schema.rb"
    end

    def move_migration_files( to_old_dir: false , to_heroku_old_dir: false )
      migrate_files.each do | filename |
        if to_heroku_old_dir and /heroku_initializer\.rb\Z/ === filename
          new_filename = filename.gsub( /migrate(?=\/.+\.rb\Z)/ , "migrate_heroku_old" )
        elsif to_old_dir
          new_filename = filename.gsub( /migrate(?=\/.+\.rb\Z)/ , "migrate_old" )
        end
        ::FileUtils.mkdir_p( ::File.dirname( new_filename ) )
        ::File.rename( filename , new_filename )
      end
    end

  end

end