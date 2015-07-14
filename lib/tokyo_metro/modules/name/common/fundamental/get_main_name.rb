module TokyoMetro::Modules::Name::Common::Fundamental::GetMainName

  private

  # 路線名などを取得するためのメソッド
  # @param var [String, ::Array, nil ...] 取得したい情報そのものの文字列 (String) 、取得したい情報を含む配列 (Array) など
  # @param allow_nil [Boolean] variable が nil の場合を許容するか否かの設定
  # @return [String] variable が文字列 (String) または配列 (Array) の場合
  # @return [nil] variable が定義されておらず、かつ allow_nil が true の場合
  def get_name( var , allow_nil: false )
    if var.instance_of?( ::String )
      return var

    elsif var.instance_of?( ::Array )
      if var.empty?
        if allow_nil
          return nil
        end

      else
        return var.first
      end

    elsif var.nil? and arrow_nil
      return nil

    else
      str = var.try( :to_s )
      if str.present?
        return str
      else
        if arrow_nil
          return nil
        else
          return ""
        end
      end

    end

    puts "Error: The variable \"#{ var }\" (#{ var.class.name }) is not valid."
    raise "Error"
  end

end
