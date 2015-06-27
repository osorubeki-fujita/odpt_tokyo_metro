class TokyoMetro::Factory::Get::Api::MetaClass::Search < TokyoMetro::Factory::Get::Api::MetaClass::Fundamental

  private

  def check_validity_of_settings( http_client )
    super( http_client )
    unless self.class.rdf_type.string?
      raise "Error"
    end
  end

  # JSON や YAML をパースして得られた配列を処理し、配列のクラスの変更と中身のハッシュのインスタンスへの置き換えを行うメソッド
  # @param ary [::Array] JSON や YAML をパースして得られた配列
  # @return [TokyoMetro::Api::Fundamental::List (or its sub-class)]
  def generate_new_array_instance( ary )
    ::TokyoMetro::Factory::Get::Api::MetaClass::Fundamental::Generator::NewArray::Search.process( ary , self.class )
  end

  # パラメータを格納したハッシュを取得するメソッド
  # @return [Hash]
  def parameters
    super().merge( { "rdf:type" => self.class.rdf_type } )
  end

end
