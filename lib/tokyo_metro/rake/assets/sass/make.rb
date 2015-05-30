module TokyoMetro::Rake::Assets::Sass::Make

  def self.partial
    Partial.process
  end

  class Partial

    def self.process
      set_instance_variables

      puts erb_files

      erb_files.each do | filepath |
        process_each_file( filepath )
      end
    end

    class << self

      private

      def set_instance_variables
        @erb_dir = "#{ ::TokyoMetro::RAILS_DIR }/app/assets/sass-partial-erbs"
        @style_sheet_dir = "#{ ::TokyoMetro::RAILS_DIR }/app/assets/stylesheets"
      end

      def erb_files
        ::Dir.glob( "#{ @erb_dir }/**/**.scss.erb" )
      end

      def process_each_file( filepath )
        scss_filepath = filepath.gsub( @erb_dir , @style_sheet_dir ).gsub( /\.erb\Z/ , "" )
        erb = ::ERB.new( ::File.open( filepath , "r:utf-8" ).read )
        erb.filename = filepath

        scss_content = erb.result.gsub( /^ +$/ , "" ).gsub( /\n+/ , "\n" ).gsub( /\A\n+/ , "" )

        ::FileUtils.mkdir_p( ::File.dirname( scss_filepath ) )
        ::File.open( scss_filepath , "w:utf-8" ) do |f|
          f.print( scss_content )
        end
      end

    end

  end

end