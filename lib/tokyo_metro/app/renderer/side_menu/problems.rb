class TokyoMetro::App::Renderer::SideMenu::Problems < TokyoMetro::Factory::Decorate::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :problems }
  = ::TokyoMetro::App::Renderer::SideMenu::Problems::Header.new( request ).render
  %ul{ class: [ :info_text , :problems ] }
    - contents_ja.each do | info |
      %li{ class: :text_ja }<
        = info
    %li{ class: :to_do }<
      = link_to( "" , url_for( controller: :document , action: :index , anchor: :to_do ) )
      = "To Do"
    HAML
  end

  private

  def h_locals
    super().merge({
      contents_ja: contents_ja ,
      contents_en: contents_en
    })
  end

  def contents_ja
    [
      "リアルタイム情報の更新ボタンが動作しない" ,
      "駅時刻表ページ（重大なバグが見つかったため公開を停止しています）"
    ]
  end

  def contents_en
    nil
  end

end
