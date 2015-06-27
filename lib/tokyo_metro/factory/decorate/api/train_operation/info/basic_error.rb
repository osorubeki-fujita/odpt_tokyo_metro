class TokyoMetro::Factory::Decorate::Api::TrainOperation::Info::BasicError < TokyoMetro::Factory::Decorate::Api::TrainOperation::Common

  def initialize( request , obj , railway_line , controller )
    super( request , obj , railway_line , controller )
    @status_type = :network_error
  end

  def status_text_ja
    "情報取得 失敗"
  end

  def status_text_en
    "Couldn't load information"
  end

  def render_status_additional_infos
    h.render inline: <<-HAML , type: :haml , locals: h_locals_for_status_additional_infos
%div{ class: :additional_infos }<
  %div{ class: :text_ja }
    %p{ class: :abstruct }<
      = text_ja_abstruct
    %p{ class: :precise }<
      = text_ja_precise
  %div{ class: :text_en }
    %p{ class: :abstruct }<
      = text_en_abstruct
    %p{ class: :precise }<
      = text_en_precise
    HAML
  end

  private

  def h_locals_for_status_additional_infos
    raise "This method \'#{ __method__ }\' is not defined in this class \'#{ self.class }\'."
  end

end
