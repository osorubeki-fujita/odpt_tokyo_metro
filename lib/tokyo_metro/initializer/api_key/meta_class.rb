class TokyoMetro::Initializer::ApiKey::MetaClass

  def Initialize
    @const_name = nil
  end

  def set
    _key_info = key_info
    if _key_info.present?
      ::TokyoMetro.const_set( @const_name.upcase , _key_info )
    else
      raise "Error: The file \"#{ filename }\" does not exist."
    end
  end

  def self.set
    self.new.set
  end

  private

  def key_info
    if on_rails_application?
      case ::Rails.env
      when "development" , "test"
        key_info_from_file
      when "production"
        ::ENV[ "TOKYO_METRO_#{ @const_name.upcase }" ]
      end
    else
      key_info_from_file
    end
  end

  def key_info_from_file
    _filename = filename
    if ::File.exist?( filename )
      open( filename , "r:utf-8").read.chomp
    else
      nil
    end
  end

  def filename
    "#{ ::TokyoMetro::RAILS_DIR }/.#{ @const_name }"
  end

end
