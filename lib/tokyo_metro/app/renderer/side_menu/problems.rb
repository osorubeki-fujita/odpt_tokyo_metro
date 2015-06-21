class TokyoMetro::App::Renderer::SideMenu::Problems < TokyoMetro::Factory::Decorate::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :problems }
  = ::TokyoMetro::App::Renderer::SideMenu::Problems::Header.new( request ).render
  %ul{ class: [ :info_text , :problems ] }
    - contents_ja.each do | info |
      %li{ class: :text_ja }<
        = info
    %li{ class: [ :to_do , :text_en ] }<
      - if open_another_window
        = link_to( "" , link_to_list_of_tasks_to_do , target: :_blank )
      - else
        = link_to( "" , link_to_list_of_tasks_to_do )
      = "To Do"
    HAML
  end

  private

  def h_locals
    super().merge({
      contents_ja: contents_ja ,
      contents_en: contents_en ,
      link_to_list_of_tasks_to_do: link_to_list_of_tasks_to_do ,
      open_another_window: open_another_window?
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

  def link_to_list_of_tasks_to_do
    url_helpers.url_for( controller: :document , action: :index , anchor: :to_do , only_path: true )
  end

  def on_the_same_controller?
    current_controller == :document
  end

  def open_another_window?
    !( on_the_same_controller? )
  end

end
