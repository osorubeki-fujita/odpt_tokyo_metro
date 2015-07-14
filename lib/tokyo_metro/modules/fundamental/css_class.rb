module TokyoMetro::Modules::Fundamental::CssClass

  # CSS のクラスの名称を取得するメソッド
  # @return [String]
  def css_class( base_method_name , header: nil )
    str = self.__send__( base_method_name )
    str = str.gsub( / Line(?:r?)/ , "" )
    str = str.gsub( / Electric/ , "" )
    str = str.gsub( / service/ , "" )
    str = str.gsub( / Company\Z/ , "" )
    str = str.gsub( / Railway\Z/ , "" )
    str = str.gsub( / Corporation/ , "" )
    str = str.gsub( /[Ee]xpress/ , "exp" )
    str = str.gsub( /[\,\(\)]/ , "" )
    str = str.gsub( /[\- ]/ , "_" )
    str = str.gsub( /_{2,}/ , "_" )
    str = str.downcase

    if header.present?
      "#{ header }_#{ str }"
    else
      str
    end
  end

end
