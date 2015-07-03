class TokyoMetro::Required < RequiredFiles::MetaClass

  class << self

    private

    def settings_for_auto_loading
      {
        namespace: ::TokyoMetro::Required::All ,
        filename: ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" )
      }
    end

  end

end
