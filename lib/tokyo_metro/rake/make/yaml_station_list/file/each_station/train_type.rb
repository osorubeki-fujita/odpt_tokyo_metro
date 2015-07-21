class TokyoMetro::Rake::Make::YamlStationList::File::EachStation::TrainType

  def self.process( h , title , content )
    self.new( h , title , content ).process
  end

  def initialize( h , title , content )
    @h = h
    @title = title
    @content = content
  end

  def process
    _content_type = content_type.to_s
    if @h[ _content_type ].nil?
      @h[ _content_type ] = train_type_infos

    elsif @h[ _content_type ].array?
      @h[ _content_type ] += train_type_infos
    end

    return nil
  end

  private

  def train_type_infos
    @title.split( / *\/ */ )
  end

  def content_type
    case @content
    # 停車
    when "○"
      :stop
    # 一部停車
    when "・" , "※" , "△"
      :some_trains_stop
    # 運転停車（代々木上原）
    when "―"
      :stop_for_drivers
    end
  end

end
