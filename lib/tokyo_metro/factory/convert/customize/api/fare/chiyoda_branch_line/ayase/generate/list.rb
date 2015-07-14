class TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::Ayase::Generate::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  private

  def process
    [ :from , :to ].each do | prefix |
      self.send( "fare_infos_#{ prefix }_ayase" ).each do | item |
        @object << ::TokyoMetro::Factory::Convert::Customize::Api::Fare::ChiyodaBranchLine::Ayase::Generate::List::EachCondition.process( item , "#{ prefix }_station" )
      end
    end
  end

  [ :from , :to ].each do | prefix |
    eval <<-DEF
      def fare_infos_#{ prefix }_ayase
        @object.select { | item | item.#{ prefix }_station == ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ayase_on_chiyoda_main_line }
      end
    DEF
  end

end
