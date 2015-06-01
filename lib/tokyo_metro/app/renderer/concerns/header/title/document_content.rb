class TokyoMetro::App::Renderer::Concerns::Header::Title::DocumentContent < TokyoMetro::App::Renderer::Concerns::Header::Title::MetaClass

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :document_title }
  = ::TokyoMetro::App::Renderer::Concerns::Header::Title::Base.new( request , ::DocumentHelper.common_title_ja , ::DocumentHelper.common_title_en ).render
  = ::TokyoMetro::App::Renderer::Concerns::Header::Title::SubContent.new( request , text_ja , text_en ).render
    HAML
  end

end
