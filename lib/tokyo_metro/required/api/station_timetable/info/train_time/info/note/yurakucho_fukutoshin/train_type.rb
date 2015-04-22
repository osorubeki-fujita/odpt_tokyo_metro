class TokyoMetro::Required::Api::StationTimetable::Info::TrainTime::Info::Note::YurakuchoFukutoshin::TrainType < RequiredFiles::MetaClass

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.top_file
    ::File.join( ::TokyoMetro::LIB_DIR , "tokyo_metro" , "api" , "station_timetable" , "info" , "train_time" , "info" , "note" , "yurakucho_fukutoshin" , "train_type" )
  end

  def self.other_files
    [
      ::Dir.glob( "#{ top_file }/**.rb" ).sort ,
      namespaces.map { | namespace |
        [
          ::File.join( top_file , namespace ) ,
          ::Dir.glob( "#{ top_file }/#{ namespace }/fundamental.rb" ).sort ,
          ::Dir.glob( "#{ top_file }/#{ namespace }/**.rb" ).sort
        ]
      }
    ]
  end

  class << self

    private

    def namespaces
      [ "fundamental" , "seibu_ikebukuro" , "tobu_tojo" , "tokyu_toyoko" ]
    end

  end

end