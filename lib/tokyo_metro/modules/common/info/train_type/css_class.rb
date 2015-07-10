module TokyoMetro::Modules::Common::Info::TrainType::CssClass

  # @!group CSS に関するメソッド

  def css_class_name
    "train_type_" + same_as.gsub( /\Acustom\.TrainType\:/ , "" ).gsub( /\ATokyoMetro\./ , "" ).gsub( "\." , "_" ).underscore.downcase
  end

  # @!endgroup

end
