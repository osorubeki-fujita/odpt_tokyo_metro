def train_location
  h1 = {"@context"=>"http://vocab.tokyometroapp.jp/context_odpt_Train.jsonld",
  "@type"=>"odpt:Train",
  "@id"=>"urn:ucode:_00001C000000000000010000030CC560",
  "dc:date"=>"2015-06-30T11:38:01+09:00",
  "dct:valid"=>"2015-06-30T11:39:31+09:00",
  "odpt:frequency"=>90,
  "odpt:railway"=>"odpt.Railway:TokyoMetro.Namboku",
  "owl:sameAs"=>"odpt.Train:TokyoMetro.Namboku.A1149T",
  "odpt:trainNumber"=>"A1149T",
  "odpt:trainType"=>"odpt.TrainType:TokyoMetro.Local",
  "odpt:delay"=>0,
  "odpt:startingStation"=>"odpt.Station:Tokyu.Meguro.Hiyoshi",
  "odpt:terminalStation"=>"odpt.Station:Toei.Mita.NishiTakashimadaira",
  "odpt:fromStation"=>"odpt.Station:TokyoMetro.Namboku.Meguro",
  "odpt:toStation"=>"odpt.Station:TokyoMetro.Namboku.Shirokanedai",
  "odpt:railDirection"=>"odpt.RailDirection:TokyoMetro.ShirokaneTakanawa",
  "odpt:trainOwner"=>"odpt.TrainOwner:Toei"}

  h2 = {"@context"=>"http://vocab.tokyometroapp.jp/context_odpt_Train.jsonld",
 "@type"=>"odpt:Train",
 "@id"=>"urn:ucode:_00001C000000000000010000030DAF78",
 "dc:date"=>"2015-06-30T11:38:01+09:00",
 "dct:valid"=>"2015-06-30T11:39:31+09:00",
 "odpt:frequency"=>90,
 "odpt:railway"=>"odpt.Railway:TokyoMetro.Namboku",
 "owl:sameAs"=>"odpt.Train:TokyoMetro.Namboku.B1081T",
 "odpt:trainNumber"=>"B1081T",
 "odpt:trainType"=>"odpt.TrainType:TokyoMetro.Local",
 "odpt:delay"=>0,
 "odpt:startingStation"=>"odpt.Station:Toei.Mita.NishiTakashimadaira",
 "odpt:terminalStation"=>"odpt.Station:Tokyu.Meguro.Hiyoshi",
 "odpt:fromStation"=>"odpt.Station:TokyoMetro.Namboku.Meguro",
 "odpt:toStation"=>nil,
 "odpt:railDirection"=>"odpt.RailDirection:TokyoMetro.Meguro",
 "odpt:trainOwner"=>"odpt.TrainOwner:Toei"}

  train_location_of_toei_mita_line_1 = ::TokyoMetro::Factory::Generate::Api::TrainLocation.process( h1 )
  train_location_of_toei_mita_line_2 = ::TokyoMetro::Factory::Generate::Api::TrainLocation.process( h2 )
  
  describe TokyoMetro::Api::TrainLocation::Info do
    it "is converted if it is on Toei Mita Line." do
      expect( train_location_of_toei_mita_line_1.railway_line ).to eq( "odpt.Railway:Toei.Mita" )
      expect( train_location_of_toei_mita_line_2.railway_line ).to eq( "odpt.Railway:Toei.Mita" )
      
      expect( train_location_of_toei_mita_line_1.railway_direction ).to eq( "odpt.RailDirection:Toei.NishiTakashimadaira" )
      expect( train_location_of_toei_mita_line_2.railway_direction ).to eq( "odpt.RailDirection:Toei.Meguro" )
      
      expect( train_location_of_toei_mita_line_1.train_type ).to eq( "odpt.TrainType:Toei.Local" )
      expect( train_location_of_toei_mita_line_2.train_type ).to eq( "odpt.TrainType:Toei.Local" )
    end
  end
  
end