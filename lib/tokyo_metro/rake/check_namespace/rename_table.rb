module TokyoMetro::Rake::CheckNamespace::RenameTable

  def self.filenames
    ary = ::Array.new

    ary  << Dir.glob( "#{ ::TokyoMetro::RAILS_DIR }/app/**/**.rb" )
    ary  << Dir.glob( "#{ ::TokyoMetro::RAILS_DIR }/app/**/**.haml" )
    ary  << Dir.glob( "#{ ::TokyoMetro::RAILS_DIR }/app/**/**.scss" )
    ary  << Dir.glob( "#{ ::TokyoMetro::RAILS_DIR }/db/schema.rb" )
    ary  << Dir.glob( "#{ ::TokyoMetro::RAILS_DIR }/lib/tokyo_metro/**/**.rb" )

    ary  << Dir.glob( "#{ ::TokyoMetro::LIB_DIR }/**/**.rb" )

    ary.flatten
  end

end