describe TokyoMetro::Modules::Common::Dictionary::Station::StringList do

  it "contains module methods returning list of stations on Marunouchi Branch Line" do

    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.nakano_sakaue_in_system ).to eq( "NakanoSakaue" )
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.nakano_sakaue ).to eq([
      "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_shimbashi_in_system ).to eq([
      "Honancho",
      "NakanoFujimicho",
      "NakanoShimbashi"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_shimbashi_invalid ).to eq([
      "odpt.Station:TokyoMetro.Marunouchi.Honancho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoFujimicho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoShimbashi"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_shimbashi ).to eq([
      "odpt.Station:TokyoMetro.MarunouchiBranch.Honancho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoFujimicho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoShimbashi"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_shimbashi_including_invalid ).to eq([
      "odpt.Station:TokyoMetro.Marunouchi.Honancho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoFujimicho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoShimbashi",
      "odpt.Station:TokyoMetro.MarunouchiBranch.Honancho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoFujimicho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoShimbashi"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_sakaue_in_system ).to eq([
      "Honancho",
      "NakanoFujimicho",
      "NakanoShimbashi",
      "NakanoSakaue"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_sakaue_on_main_line ).to eq([
      "odpt.Station:TokyoMetro.Marunouchi.Honancho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoFujimicho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoShimbashi",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_sakaue ).to eq([
      "odpt.Station:TokyoMetro.MarunouchiBranch.Honancho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoFujimicho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoShimbashi",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_honancho_and_nakano_sakaue_including_invalid ).to eq([
      "odpt.Station:TokyoMetro.Marunouchi.Honancho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoFujimicho",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoShimbashi",
      "odpt.Station:TokyoMetro.Marunouchi.NakanoSakaue",
      "odpt.Station:TokyoMetro.MarunouchiBranch.Honancho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoFujimicho",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoShimbashi",
      "odpt.Station:TokyoMetro.MarunouchiBranch.NakanoSakaue"
    ])

  end

  it "contains module methods returning list of stations in sections where Yurakucho Line and Fukutoshin Line share tracks" do
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.wakoshi_in_system ).to eq( "Wakoshi" )
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.wakoshi ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.kotake_mukaihara_in_system ).to eq( "KotakeMukaihara" )
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.kotake_mukaihara ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.ikebukuro_in_system ).to eq( "Ikebukuro" )
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.ikebukuro_on_yurakucho_or_fukutoshin_line ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Ikebukuro",
      "odpt.Station:TokyoMetro.Fukutoshin.Ikebukuro"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.wakoshi_and_kotake_mukaihara_in_system ).to eq([
      "Wakoshi",
      "KotakeMukaihara"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.wakoshi_and_kotake_mukaihara ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_chikatetsu_narimasu_and_hikawadai_in_system ).to eq([
      "ChikatetsuNarimasu",
      "ChikatetsuAkatsuka",
      "Heiwadai",
      "Hikawadai"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_chikatetsu_narimasu_and_hikawadai ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_hikawadai_in_system ).to eq([
      "Wakoshi",
      "ChikatetsuNarimasu",
      "ChikatetsuAkatsuka",
      "Heiwadai",
      "Hikawadai"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_hikawadai ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_kotake_mukaihara_in_system ).to eq([
      "Wakoshi",
      "ChikatetsuNarimasu",
      "ChikatetsuAkatsuka",
      "Heiwadai",
      "Hikawadai",
      "KotakeMukaihara"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_kotake_mukaihara ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_senkawa_and_kanamecho_in_system ).to eq([
      "Senkawa",
      "Kanamecho"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_senkawa_and_kanamecho ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Senkawa",
      "odpt.Station:TokyoMetro.Yurakucho.Kanamecho",
      "odpt.Station:TokyoMetro.Fukutoshin.Senkawa",
      "odpt.Station:TokyoMetro.Fukutoshin.Kanamecho"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_kanamecho_in_system ).to eq([
      "Wakoshi",
      "ChikatetsuNarimasu",
      "ChikatetsuAkatsuka",
      "Heiwadai",
      "Hikawadai",
      "KotakeMukaihara",
      "Senkawa",
      "Kanamecho"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_kanamecho ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Yurakucho.Senkawa",
      "odpt.Station:TokyoMetro.Yurakucho.Kanamecho",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.Senkawa",
      "odpt.Station:TokyoMetro.Fukutoshin.Kanamecho"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.yurakucho_and_fukutoshin_common_stations_in_system ).to eq([
      "Wakoshi",
      "ChikatetsuNarimasu",
      "ChikatetsuAkatsuka",
      "Heiwadai",
      "Hikawadai",
      "KotakeMukaihara",
      "Senkawa",
      "Kanamecho",
      "Ikebukuro"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.yurakucho_and_fukutoshin_common_stations ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Yurakucho.Senkawa",
      "odpt.Station:TokyoMetro.Yurakucho.Kanamecho",
      "odpt.Station:TokyoMetro.Yurakucho.Ikebukuro",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.Senkawa",
      "odpt.Station:TokyoMetro.Fukutoshin.Kanamecho",
      "odpt.Station:TokyoMetro.Fukutoshin.Ikebukuro"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.between_wakoshi_and_ikebukuro ).to eq([
      "odpt.Station:TokyoMetro.Yurakucho.Wakoshi",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Yurakucho.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Yurakucho.Heiwadai",
      "odpt.Station:TokyoMetro.Yurakucho.Hikawadai",
      "odpt.Station:TokyoMetro.Yurakucho.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Yurakucho.Senkawa",
      "odpt.Station:TokyoMetro.Yurakucho.Kanamecho",
      "odpt.Station:TokyoMetro.Yurakucho.Ikebukuro",
      "odpt.Station:TokyoMetro.Fukutoshin.Wakoshi",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuNarimasu",
      "odpt.Station:TokyoMetro.Fukutoshin.ChikatetsuAkatsuka",
      "odpt.Station:TokyoMetro.Fukutoshin.Heiwadai",
      "odpt.Station:TokyoMetro.Fukutoshin.Hikawadai",
      "odpt.Station:TokyoMetro.Fukutoshin.KotakeMukaihara",
      "odpt.Station:TokyoMetro.Fukutoshin.Senkawa",
      "odpt.Station:TokyoMetro.Fukutoshin.Kanamecho",
      "odpt.Station:TokyoMetro.Fukutoshin.Ikebukuro"
    ])
  end

  it "contains module methods returning list of stations in sections where Yurakucho Line and Fukutoshin Line share tracks" do
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.namboku_and_toei_mita_line_common_stations_in_system ).to eq([
      "Meguro",
      "Shirokanedai",
      "ShirokaneTakanawa"
    ])
    expect( TokyoMetro::Modules::Common::Dictionary::Station::StringList.namboku_and_toei_mita_line_common_stations ).to eq([
      "odpt.Station:TokyoMetro.Namboku.Meguro",
      "odpt.Station:TokyoMetro.Namboku.Shirokanedai",
      "odpt.Station:TokyoMetro.Namboku.ShirokaneTakanawa",
      "odpt.Station:Toei.Mita.Meguro",
      "odpt.Station:Toei.Mita.Shirokanedai",
      "odpt.Station:Toei.Mita.ShirokaneTakanawa"
    ])
  end

end