class TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::NetworkError < TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::BasicError

  private

  def h_locals_for_status_additional_infos
    {
      text_ja_abstruct: "ネットワークエラー" ,
      text_ja_precise: "接続を確認し、ページを更新してください" ,
      text_en_abstruct: "Error on network" ,
      text_en_precise: "Check your network and reload this page."
    }
  end

end
