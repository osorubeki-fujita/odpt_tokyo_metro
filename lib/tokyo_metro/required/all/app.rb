class TokyoMetro::Required::All::App < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [ Renderer.files , Container.files ]
  end

end
