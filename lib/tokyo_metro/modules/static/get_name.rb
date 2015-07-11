# 路線名などを取得するためのメソッドを提供するモジュール
module TokyoMetro::Modules::Static::GetName

  def name_ja_inspect
    name_inspect( @name_ja )
  end

  def name_hira_inspect
    name_inspect( @name_hira )
  end

  def name_en_inspect
    name_inspect( @name_en )
  end

  private

  def name_inspect( name_base )
    if name_base.instance_of?( ::Array )
      name_base.join( "/" )
    elsif name_base.instance_of?( ::String )
      name_base
    end
  end

  # 路線名などを取得するためのメソッド
  # @param variable [String, ::Array, nil ...] 取得したい情報そのものの文字列 (String) 、取得したい情報を含む配列 (Array) など
  # @param allow_nil [Boolean] variable が nil の場合を許容するか否かの設定
  # @return [String] variable が文字列 (String) または配列 (Array) の場合
  # @return [nil] variable が定義されておらず、かつ allow_nil が true の場合
  def get_name( variable , allow_nil: false )
    if variable.instance_of?( ::String )
      return variable
    elsif variable.instance_of?( ::Array )
      if variable.empty?
        if allow_nil
          return nil
        end
      else
        return variable.first
      end
    elsif variable.nil? and allow_nil
      return nil
    end

    puts "Error: The variable \"#{variable}\" (#{variable.class.name}) is not valid."
    raise "Error"
  end

end
