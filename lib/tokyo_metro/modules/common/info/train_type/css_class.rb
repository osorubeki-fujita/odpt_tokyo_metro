module TokyoMetro::Modules::Common::Info::TrainType::CssClass

  # @!group CSS に関するメソッド

  def css_class
    regexp = /\Acustom\.TrainType\:(?:[a-zA-Z]+)\.(?:[a-zA-Z]+)\./
    same_as.gsub( regexp , "" ).gsub( /\./ , "_" ).underscore
  end

  def color_basename
    "train_type_" + same_as.gsub( /\Acustom\.TrainType\:/ , "" ).gsub( /\ATokyoMetro\./ , "" ).gsub( "\." , "_" ).underscore.downcase
  end

  # @!endgroup

end
