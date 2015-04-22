class TokyoMetro::Required::All::Api::StationTimetable::Info::TrainTime::Info::Note::YurakuchoFukutoshin::TrainType < TokyoMetro::Required

  def initialize
    super( set_all_files_under_the_top_namespace: false )
  end

  def self.other_files
    [
      all_files_in_the_same_directory ,
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