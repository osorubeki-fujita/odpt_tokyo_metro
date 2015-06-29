# API から取得したハッシュからインスタンスを生成するための Factory Pattern のクラス（メタクラス）
class TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental

  # Constructor
  # @param var [Hash / Array / String] インスタンスの元となるハッシュ，配列，文字列
  # @note ハッシュは第1階層の情報であるとは限らない。
  def initialize( var , on_the_top_layer: true )
    @on_the_top_layer = on_the_top_layer
    if to_check_validity? and var.instance_of?( ::Hash )
      check_validity( var )
    end
    if var.instance_of?( ::Hash )
      @hash = var
    elsif var.instance_of?( ::Array )
      @array = var
    elsif var.instance_of?( ::String )
      @string = var
    end
  end

  # API から取得したハッシュからインスタンスを生成するためのインスタンスメソッド
  # @note ハッシュは第1階層の情報であるとは限らない。
  # @return [Object] self.class.info_class のインスタンス
  def generate
    self.class.instance_class.new( *variables )
  end

  def to_check_validity?
    @on_the_top_layer
  end

  # API から取得したハッシュからインスタンスを生成するためのクラスメソッド
  # @param h [Hash] インスタンスの元となるハッシュ
  # @note ハッシュは第1階層の情報であるとは限らない。
  def self.process(h)
    self.new(h).generate
  end

  def self.instance_class
    info_class
  end

  private

  # Info クラスに送る変数のリスト
  # @return [::Array]
  # @raise [RuntimeError] サブクラスで定義するため、このクラスでは例外が発生するようにしている。
  def variables
    raise "The class method \"#{__method__}\" is not defined yet in this class."
  end

  # API から取得したデータをもとにインスタンスを作成する際に、RDF タイプ、 Context などが正しいか否かをチェックするメソッド (1)
  # @param h [Hash] API から取得したデータのハッシュ
  # @return [nil]
  def check_validity( h , barrier_free: false )
    if barrier_free
      ::TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::BarrierFree.process( h , self.class )
    else
      ::TokyoMetro::Factory::Generate::Api::MetaClass::Info::Fundamental::ValidityChecker::Normal.process( h , self.class )
    end
  end

end
