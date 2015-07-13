module TokyoMetro::Modules::Common::Info::Decision::RailwayLine

  # @!group 路線に関するメソッド

  ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/railway_line/tokyo_metro_lines_in_system.yaml" ).each do | item |
    railway_line_base_name = item.underscore.downcase
    eval <<-DEF
      def on_#{ railway_line_base_name }_line?
        on_the_railway_line_of?( ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringInfo.#{ railway_line_base_name } )
      end

      #-------- [alias]
      alias :#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
      alias :is_on_#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
      alias :is_#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
    DEF
  end

  def on_marunouchi_line_including_branch?
    on_the_railway_line_of?( *( ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringList.marunouchi_main_and_branch_line_same_as ) )
  end

  def on_yurakucho_or_fukutoshin_line?
    on_the_railway_line_of?( *( ::TokyoMetro::Modules::Common::Dictionary::RailwayLine::StringList.yurakucho_and_fukutoshin_line_same_as ) )
  end

  def on_toei_mita_line?
    on_the_railway_line_of?( "odpt.Railway:Toei.Mita" )
  end

  def on_namboku_or_toei_mita_line?
    on_namboku_line? or on_toei_mita_line?
  end

  #-------- [alias]
  [ :marunouchi_line_including_branch , :yurakucho_or_fukutoshin_line , :namboku_or_toei_mita_line , :toei_mita_line ].each do | method_base_name |
    eval <<-ALIAS
      alias :#{method_base_name}? :on_#{method_base_name}?
      alias :is_on_#{method_base_name}? :on_#{method_base_name}?
      alias :is_#{method_base_name}? :on_#{method_base_name}?
    ALIAS
  end

  def shinkansen?
    shinkansen_of_jr_east? or shinkansen_of_jr_central?
  end

  def toden_arakawa_line?
    on_the_railway_line_of?( "odpt.Railway:Toei.TodenArakawa" )
  end

  def jr_lines?
    on_the_railway_line_of?( "odpt.Railway:JR-East" )
  end

  def shinkansen_of_jr_east?
    on_the_railway_line_of?( "odpt.Railway:JR-East.Shinkansen" , "odpt.Railway:JR-East.Shinkansen.2015" , "odpt.Railway:JR-East.Shinkansen.2016" )
  end

  def shinkansen_of_jr_central?
    on_the_railway_line_of?( "odpt.Railway:JR-Central.Shinkansen" )
  end

  def minatomirai_line?
    on_the_railway_line_of?( "odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai" )
  end

  def tobu_sky_tree_isesaki_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.SkyTreeIsesaki" )
  end

  def seibu_yurakucho_line?
    on_the_railway_line_of?( "odpt.Railway:Seibu.SeibuYurakucho" )
  end

  def keio_line?
    on_the_railway_line_of?( "odpt.Railway:Keio.Keio" )
  end

  def yurikamome_line?
    on_the_railway_line_of?( "odpt.Railway:Yurikamome.Yurikamome" )
  end

  # @!endgroup

  private

  def on_the_railway_line_of?( *args , compared: railway_line.same_as )
    compare_base( args , compared )
  end

end
