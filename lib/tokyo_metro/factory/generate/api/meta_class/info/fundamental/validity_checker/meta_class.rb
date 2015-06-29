class TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::MetaClass

  def initialize( h , namespace )
    @h = h
    @namespace = namespace
    @class_methods_in_toplevel_namespace = @namespace.instance_class.methods.sort
  end

  def self.process( h , namespace )
    self.new( h , namespace ).process
  end

  def process
    class_method_names_and_hash_keys.keys.each do | class_method_name |
      if @class_methods_in_toplevel_namespace.include?( class_method_name )
        convert_elevator_and_escalator( class_method_name )
        raise_error( class_method_name )
      end
    end
  end

  private

  def convert_elevator_and_escalator( class_method_name )
    valid_value = valid_value_of_hash( class_method_name )
    hash_key = class_method_names_and_hash_keys[ class_method_name ]

    unless @h[ hash_key ] == valid_value
      case valid_value
      when "エレベータ" , "エスカレータ"
        invalid_value = "#{ valid_value }ー"
        if @h[ hash_key ] == invalid_value
          @h[ hash_key ] = valid_value
          # puts "=" * 8 + " ☆ Convert"
          # puts @h[ "owl:sameAs" ]
          # puts "#{ invalid_value } => #{ valid_value }"
          # puts ""
        # elsif @h[ hash_key ] == valid_value
          # puts "-" * 8 + " ○ No convert"
          # puts @h[ "owl:sameAs" ]
          # puts ""
        end

      when "http://vocab.tokyometroapp.jp/context_odpt_StationTimetable.jsonld"
        invalid_value = "http://www.odpt.org/context.jsonld"
        if @h[ hash_key ] == invalid_value
          @h[ hash_key ] = valid_value
        end
      end

    end
  end

  def raise_error( class_method_name )
    valid_value = valid_value_of_hash( class_method_name )
    hash_key = class_method_names_and_hash_keys[ class_method_name ]

    if @h[ hash_key ].present? and @h[ hash_key ] != valid_value
      puts "● Error"
      puts @h.to_s
      puts ""
      puts "Error: The value of #{ hash_key } (#{ @h[ hash_key ].to_s } \[#{ @h[ hash_key ].class.name }\], from API) is not valid."
      puts "  It should be \"#{ valid_value }\" \[#{ valid_value.class.name }\]."
      puts "Instance Class: #{ @namespace.instance_class }"
      raise "Error"
    end
  end

  def valid_value_of_hash( class_method_name )
    @namespace.instance_class.send( class_method_name )
  end

end
