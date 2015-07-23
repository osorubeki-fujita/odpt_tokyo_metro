class TokyoMetro::Factory::Decorate::MetaClass < RailsDecorateFactory

  [ :railway_line , :station , :survey_year ].each do | method_base_name |
    eval <<-DEF
      def #{ method_base_name }_of( url )
        begin
          recognize_path( url )[ :#{ method_base_name } ]
        rescue ::ActionController::RoutingError
          nil
        end
      end

      def current_#{ method_base_name }
        current_position( :#{ method_base_name } )
      end
    DEF
  end

end
