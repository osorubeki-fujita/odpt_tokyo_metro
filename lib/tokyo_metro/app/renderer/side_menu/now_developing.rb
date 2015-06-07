class TokyoMetro::App::Renderer::SideMenu::NowDeveloping < TokyoMetro::Factory::Decorate::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :now_developing }
  = ::TokyoMetro::App::Renderer::SideMenu::NowDeveloping::Header.new( request ).render
  %div{ class: :info_text }
    %div{ class: :text_ja }
      - contents_ja.each do | row |
        %p<
          = row
    %div{ class: :text_en }
      %p<
        = contents_en
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
    [ "ただいま開発中につき" , "間違っている情報が" , "含まれている場合があります" ]
  end

  def contents_en
    "The library 'Rails on Ruby' and this web-application is now under development. Please note that some contents in this app may be wrong."
  end

end
