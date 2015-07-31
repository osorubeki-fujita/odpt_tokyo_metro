class TokyoMetro::Factory::Seed::Static::TwitterAccount::Info < TokyoMetro::Factory::Seed::Static::MetaClass::Info

  include ::TokyoMetro::ClassNameLibrary::Static::TwitterAccount

  def set_optional_variables( var )
    @info_id = var
  end

  def hash_to_db
    {
      widget_id: @info.widget_id ,
      name: @info.account_name ,
      operator_info_or_railway_line_info_id: @info_id ,
      operator_info_or_railway_info_type: @info.db_class_of_parent_info
    }
  end

end

__END__

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
