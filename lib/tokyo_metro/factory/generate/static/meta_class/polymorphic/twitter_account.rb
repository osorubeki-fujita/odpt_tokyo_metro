module TokyoMetro::Factory::Generate::Static::MetaClass::Polymorphic::TwitterAccount

  private

  def set_twitter_account_info
      if @h[ :twitter ].present?
        @hash_for_making_variables[ :twitter_account_info ] = ::TokyoMetro::Static::TwitterAccount::Info.generate_from_hash( @h[ :twitter ] , self.class.db_instance_class_str )
      end
  end

end
