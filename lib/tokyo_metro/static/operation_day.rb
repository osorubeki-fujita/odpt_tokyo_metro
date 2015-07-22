class TokyoMetro::Static::OperationDay < TokyoMetro::Static::Fundamental::MetaClass::UsingOneYaml

  include ::TokyoMetro::ClassNameLibrary::Static::OperationDay

  # @!group 運行日のリスト

  # 定数を設定するクラスメソッド
  # @return [nil]
  def self.set_constant
    ::TokyoMetro::Static.const_set( :OPERATION_DAY_INFOS , generate_from_yaml )
  end

  # @!endgroup

  def self.of_current
    as_of( ::TokyoMetro.time_now )
  end

  def self.as_of( time )
    if time.hour < ::TokyoMetro::DATE_CHANGING_HOUR
      t = time.yesterday
    else
      t = time
    end
    ::DateTime.new( t.year , t.month , t.day , 12 , 0 , 0 , t.zone )
  end

end

__END__

module TokyoMetro::Modules::Dictionary::Common::OperationDay

  include ::PositiveBasicSupport::Modules::ConstantsAsClassMethods

  ::YAML.load_file( "#{ ::TokyoMetro.dictionary_dir }/operation_day.yaml" ).each do | item |
    const_name = item[ "name_en" ].gsub( /\,? / , "_" ).upcase.intern
    const_set( const_name , item.with_indifferent_access )
  end

  def self.constants_except_for_class_methods
    ( self.constants - [ :ClassMethods ] )
  end

  def self.list
    constants_except_for_class_methods.map { | const_name |
      h = const_get( const_name )
      [ h[ :name_ja ] , h[ :name_en ] ]
    }
  end

  def self.hash_list
    h = ::Hash.new
    constants_except_for_class_methods.each do | const_name |
      h_const = const_get( const_name )
      h[ h_const[ :name_en ] ] = h_const
    end
    h
  end

end
