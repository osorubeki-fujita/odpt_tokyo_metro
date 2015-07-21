# 駅名のリストを作成するためのクラス（メタクラス）
class TokyoMetro::Rake::Make::YamlStationList

  def self.process
    self.new.process
  end

  def initialize
    @filenames = ::Dir.glob( "#{ ::TokyoMetro::GEM_DB_DIR }/dictionary/station/**/**.csv" )
  end

  def process
    puts "* #{ self.class.name } - Make list of stations"
    put_empty_row

    @filenames.each do | filename |
      ::TokyoMetro::Rake::Make::YamlStationList::File.process( filename )
    end
    return nil
  end

end
