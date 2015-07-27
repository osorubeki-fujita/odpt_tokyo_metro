module TokyoMetro::Rake::Rails::Assets::Sass::Make

  def self.from_erb_files( on: nil )
    raise unless on.present?
    rails_dir = on
    ::TokyoMetro::Rake::Rails::Assets::Sass::Make::FromErbFiles.process( on: rails_dir )
  end

end
