# リアルタイム情報を処理するためのクラス
class TokyoMetro::ApiProcessor::RealTimeInfos

  # Constructor
  # @param railway_line_infos [::Railway] 路線（複数）の情報（ActiveRecord により取得）
  # @param http_client [::HTTPClient.new] リアルタイム情報を取得するための HTTP クライアントのインスタンス
  def initialize( railway_line_infos: ::Railway::Line::Info.tokyo_metro , http_client: ::HTTPClient.new )
    @railway_line_infos = railway_line_infos
    raise "Error" unless has_any_railway_line?

    @http_client = http_client

    initialize_list_of_real_time_infos
    set_train_operation_infos_of_railway_line_infos( all: true )

    @provision_status = ::TokyoMetro::ApiProcessor::RealTimeInfos::ProvisionStatus.new
  end

  attr_reader :railway_line_infos
  attr_reader :http_client
  attr_reader :infos_of_each_railway_line

  # 列車運行情報、列車ロケーション情報の配信状況
  # @return [::TokyoMetro::ApiProcessor::RealTimeInfos::ProvisionStatus]
  attr_reader :provision_status

  include ::Singleton

  # @!group 路線（複数）の情報

  # 支線を除く路線（複数）のインスタンス
  def railway_line_infos_except_for_branch_lines
    @railway_line_infos.except_for_branch_lines
  end

  # インスタンス変数 railway_line_infos に路線の情報が含まれているか否かを判定するメソッド
  # @return [Boolean]
  def has_any_railway_line?
    @railway_line_infos.present?
  end

  # インスタンス変数 railway_line_infos に含まれている路線の情報が1つか否かを判定するメソッド
  # @return [Boolean]
  def has_one_railway_line?
    @railway_line_infos.length == 1
  end

  # インスタンス変数 railway_line_infos に含まれている路線の情報が複数か否かを判定するメソッド
  # @return [Boolean]
  def has_many_railway_line_infos?
    @railway_line_infos.length > 1
  end

  # インスタンス変数 railway_line_infos に「支線ではない路線」の情報が含まれているか否か
  # @return [Boolean]
  def has_any_railway_line_except_for_branch_lines?
    railway_line_infos_except_for_branch_lines.present?
  end

  # インスタンス変数 railway_line_infos に含まれている「支線ではない路線」の情報が1つか否かを判定するメソッド
  # @return [Boolean]
  def has_one_railway_line_except_for_branch_lines?
    railway_line_infos_except_for_branch_lines.length == 1
  end

  # インスタンス変数 railway_line_infos に含まれている「支線ではない路線」の情報が1つか否かを判定するメソッド
  # @return [Boolean]
  def has_many_railway_line_infos_except_for_branch_lines?
    railway_line_infos_except_for_branch_lines.length > 1
  end

  # @!group 列車運行情報

  [
    :has_any_train_operation_info? ,
    :has_any_train_location? ,
    :dc_date_times_of_train_operation_info
  ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @infos_of_each_railway_line.#{ method_name }
      end
    DEF
  end

  # @!group 列車運行情報、列車ロケーション情報の配信状況

  [
    :train_operation_infos_provided? ,
    :train_location_infos_provided? ,
    :train_operation_infos_are_not_provided! ,
    :train_location_infos_are_not_provided!
  ].each do | method_name |
    eval <<-DEF
      def #{ method_name }
        @provision_status.#{ method_name }
      end
    DEF
  end

  # @!endgroup

  private

  # @!group Constructor で使用する private メソッド - private methods in the constructor

  def initialize_list_of_real_time_infos
    @infos_of_each_railway_line = ::TokyoMetro::ApiProcessor::RealTimeInfos::RailwayLine::List.new(
      railway_line_infos_except_for_branch_lines.map { | railway_line |
      ::TokyoMetro::ApiProcessor::RealTimeInfos::RailwayLine::Info.new( railway_line , @http_client )
      }
    )
  end

  # @!endgroup

  # インスタンス変数 infos_of_each_railway_line の各要素に運行情報をセットするメソッド
  # @note Constructor でも使用する
  def set_train_operation_infos_of_railway_line_infos( *railway_line_infos_same_as , all: nil )
    _new_train_operation_infos = new_train_operation_infos_in_api( railway_line_infos_same_as , all )
  end

  # 新しい運行情報を API から取得するメソッド
  # @param [String] railway_line_infos_same_as 運行情報をセットしたい路線の名称 (same_as)
  # @note railway_line_infos_same_as が指定されておらず、all が true の場合、すべての路線について取得する。
  # @return [::TokyoMetro::Api::TrainOperation::List]
  def new_train_operation_infos_in_api( railway_line_infos_same_as , all )
    _railway_line_infos_for_getting_train_operation_infos = railway_line_infos_for_getting_train_operation_infos( railway_line_infos_same_as , all )
    selected_railway_line_infos_same_as = railway_line_infos_for_getting_train_operation_infos( railway_line_infos_same_as , all ).pluck( :same_as )
    train_operation_infos = ::TokyoMetro::Api::TrainOperation.get(
      @http_client ,
      parse_json: true ,
      generate_instance: true
    )
    sleep( 0.2 )
    # 列車運行情報の取得に失敗した場合
    unless succeed_to_get_new_train_operation_infos?( _railway_line_infos_for_getting_train_operation_infos , train_operation_infos )
      # 取得できた列車運行情報がない場合
      if got_no_train_operation_info?
        # 列車運行情報の配信ステータスを false とする
        train_operation_infos_are_not_provided!
      end
    end
    train_operation_infos
  end

  # 列車運行情報の取得に成功したか否かを判定するメソッド
  def succeed_to_get_new_train_operation_infos?( _railway_line_infos_for_getting_train_operation_infos , train_operation_infos )
    _railway_line_infos_for_getting_train_operation_infos.sort == train_operation_infos.railway_line_infos_same_as.sort
  end

  def got_no_train_operation_info?( train_operation_infos )
    train_operation_infos.empty?
  end

  def railway_line_infos_included_in_infos_of_each_railway_line
    @infos_of_each_railway_line_infos.railway_line_infos
  end

  def railway_line_infos_same_as_included_in_infos_of_each_railway_line
    @infos_of_each_railway_line_infos.railway_line_infos_same_as
  end

  def railway_line_infos_for_getting_train_operation_infos( railway_line_infos_same_as , all )
    # 路線名が指定されていない場合
    if railway_line_infos_same_as.blank? or railway_line_infos_same_as == [ nil ]
      unless all
        raise "Error"
      end
      railway_line_infos_except_for_branch_lines

    # 路線名が指定されている場合
    else
      unless all.nil? or !( all )
        raise "Error"
      end
      r = railway_line_infos_same_as_included_in_infos_of_each_railway_line
      unless railway_line_infos_same_as.all? { | railway_line_same_as | r.include?( railway_line_same_as ) }
        raise "Error"
      end
      railway_line_infos_except_for_branch_lines.where( same_as: railway_line_infos_same_as )
    end
  end

end
