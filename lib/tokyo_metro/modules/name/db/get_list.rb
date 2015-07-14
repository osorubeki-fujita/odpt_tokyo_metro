module TokyoMetro::Modules::Name::Db::GetList

  private

  def get_list( var , allow_nil: false )
    if var.instance_of?( ::String )
      return var.split( /\// )

    elsif var.instance_of?( ::Array )
      if var.empty?
        if allow_nil
          return nil
        end

      else
        return var
      end

    elsif var.nil? and arrow_nil
      return nil

    else
      str = var.try( :to_a )
      if str.present?
        return str
      else
        if arrow_nil
          return nil
        else
          return ::Array.new
        end
      end

    end

    puts "Error: The variable \"#{ var }\" (#{ var.class.name }) is not valid."
    raise "Error"
  end

end
