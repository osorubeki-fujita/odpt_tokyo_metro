module TokyoMetro::App::Renderer::Rss

  LIST = ::YAML.load_file( "#{ ::TokyoMetro::DICTIONARY_DIR }/view/rss.yaml")

  def self.test
    feed_urls = LIST.values.map { | item | item[ "url" ] }
    feed_urls.each do | feed_url |
      feed = ::Feedjira::Feed.fetch_and_parse(feed_urls.first)

      p feed.title          # => "PILOG"
      p feed.url            # => "http://xoyip.hatenablog.com/"
      p feed.feed_url       # => "http://xoyip.hatenablog.com/feed"
      p feed.etag           # => "f6ce826cbbd07e222b6cee445fc981f730ad0693"
      p feed.last_modified  # => 2014-01-15 11:47:34 UTC
      p feed.entries.count  # => 7
      p ""
    end
  end

end