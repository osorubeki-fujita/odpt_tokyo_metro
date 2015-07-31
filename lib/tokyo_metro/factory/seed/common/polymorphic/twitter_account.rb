module TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  private

  def seed_twitter_account_info
    @info.twitter_account_info.try( :seed , @id )
  end

end
