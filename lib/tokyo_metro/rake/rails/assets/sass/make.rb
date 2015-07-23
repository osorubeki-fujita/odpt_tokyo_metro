module TokyoMetro::Rake::Rails::Assets::Sass::Make

  def self.partial( on: nil )
    raise unless on.present?
    rails_dir = on
    ::TokyoMetro::Rake::Rails::Assets::Sass::Make::Partial.process( on: rails_dir )
  end

end
