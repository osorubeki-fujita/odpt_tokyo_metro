module TokyoMetro::Modules::Decision::Common::Fundamental::CompareBase

  private

  def compare_base( *args , compared )
    raise if args.empty?

    if compared.nil?
      return false
    end

    args = args.flatten

    unless args.instance_of?( ::Array ) and args.all? { | item | item.string? or item.regexp? }
      class_list = args.map( &:class )
      raise "#{ args.to_s } (#{ class_list.to_s }) is not valid."
    end

    unless compared.string? or ( compared.array? and compared.all?( &:string? ) )
      raise "Error: \[#{ compared.class.name }\] #{ compared.to_s }"
    end

    if compared.string?
      args.any? { | item | item === compared }
    else
      compared.any? { | compared_each_item |
        args.any? { | item | item === compared_each_item }
      }
    end
  end

end
