class TokyoMetro::Initializer::Rails

  def set( as_for: nil )
    raise unless as_for.instance_of?( ::String )
    rails_dir = as_for
    dev_dir = "#{ rails_dir }/dev"

    ::TokyoMetro.module_eval do
      # Directory of Rails application
      const_set( :RAILS_DIR , rails_dir ) # "C:/RubyPj/rails/tokyo_metro"

      # 開発のためのファイルを格納するディレクトリ
      const_set( :DEV_DIR , dev_dir ) # "C:/RubyPj/rails/tokyo_metro/dev"

      # fixture ファイルを格納するディレクトリ
      const_set( :RAILS_FIXTURES_DIR , "#{ rails_dir }/test/fixtures" )

      # HTML のディレクトリ
      const_set( :HTML_DIR , "#{ dev_dir }/app/html" )

      # HAML のディレクトリ
      const_set( :HAML_DIR , "#{ dev_dir }/app/haml" )

      # CSS のディレクトリ
      const_set( :CSS_DIR , "#{ dev_dir }/app/assets/css" )

      # SCSS のディレクトリ
      const_set( :SCSS_DIR , "#{ dev_dir }/app/assets/scss" )
    end

    return nil
  end

  def self.consts_in_gem
    self.new
  end

end
