module TokyoMetro::Factory::Seed::Common::Polymorphic::TwitterAccount

  private

  def seed_twitter_account
    if @info.twitter_widget_id.present? and @info.twitter_account_name.present?
      ::TwitterAccount.create(
        widget_id: @info.twitter_widget_id.to_s ,
        name: @info.twitter_account_name ,
        operator_info_or_railway_line_info_id: @id ,
        operator_info_or_railway_info_type: twitter_polymorphic_type
      )
    end
  end

  def twitter_polymorphic_type
    db_class.to_s
  end

end
