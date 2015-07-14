# 路線名などを取得するためのメソッドを提供するモジュール
module TokyoMetro::Modules::Fundamental::Get::NameForInspection

  def name_ja_inspect
    name_for_inspection( @name_ja )
  end

  def name_hira_inspect
    name_for_inspection( @name_hira )
  end

  def name_en_inspect
    name_for_inspection( @name_en )
  end

  private

  def name_for_inspection( var , arrow_nil: false )
    if var.instance_of?( ::Array )
      var.join( "/" )
    elsif var.instance_of?( ::String )
      var
    else
      str = var.try( :to_s )
      if str.present?
        str
      elsif arrow_nil
        nil
      else
        ""
      end
    end
  end

end
