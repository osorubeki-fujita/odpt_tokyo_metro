module TokyoMetro::Modules::MethodMissing::Dictionary::Common::RailwayLine::StringInfo

  extend ::ActiveSupport::Concern
  
  module ClassMethods

    def method_missing( method_name , *args )
      if /_line\Z/ === method_name.to_s
        send( method_name.to_s.gsub( /_line\Z/ , "" ) , *args )
      else
        super( method_name , *args )
      end
    end

  end

end
