module TokyoMetro::Rake::Rails::Deploy::Heroku::Csv

  def self.convert_to_shift_jis( time_dirname )
    utf8_files = ::Dir.glob( "#{ ::Rails.root }/db/csv/#{ time_dirname }/utf8/**.csv" )
    shift_jis_dirname = ::File.dirname( utf8_files.first ).gsub( /utf8\/?\Z/ , "shift_jis" )
    ::FileUtils.mkdir_p( shift_jis_dirname )

    utf8_files.each do | utf8_file |
      new_filename = "#{ shift_jis_dirname }/#{ ::File.basename( utf8_file ) }"
      utf8_file_content = ::File.open( utf8_file , "r:utf-8" ).read.split( /\n/ )

      if utf8_file_content.present?

        kojimachi_regexp = /麴町/
        shift_jis_file_content = utf8_file_content.map { | str |
          if kojimachi_regexp =~ str
            str = str.gsub( kojimachi_regexp , "麹町" )
          end
          str.encode( "windows-31j" )
        }.join( "\n" )

        ::File.open( new_filename , "w:windows-31j" ) do |f|
          f.print shift_jis_file_content
        end

      end

    end
  end

end