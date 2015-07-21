module TokyoMetro::Modules::Decision::Common::RailwayLine::Name

  # @!group 路線に関するメソッド

  ::YAML.load_file( "#{ ::TokyoMetro::dictionary_dir }/railway_line/tokyo_metro_lines_in_system.yaml" ).each do | item |
    railway_line_base_name = item.underscore.downcase
    eval <<-DEF
      def on_#{ railway_line_base_name }_line?
        on_the_railway_line_of?( ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.#{ railway_line_base_name } )
      end

      #-------- [alias]
      alias :#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
      alias :is_on_#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
      alias :is_#{ railway_line_base_name }_line? :on_#{ railway_line_base_name }_line?
    DEF
  end

  # @!group 複数の路線の判定

  def on_marunouchi_line_including_branch?
    on_the_railway_line_of?( *( ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringList.marunouchi_main_and_branch_line_same_as ) )
  end

  def on_yurakucho_or_fukutoshin_line?
    on_the_railway_line_of?( *( ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringList.yurakucho_and_fukutoshin_line_same_as ) )
  end

  def on_namboku_or_toei_mita_line?
    on_namboku_line? or on_toei_mita_line?
  end

  #-------- [alias]
  [ :marunouchi_line_including_branch , :yurakucho_or_fukutoshin_line , :namboku_or_toei_mita_line ].each do | method_base_name |
    eval <<-ALIAS
      alias :#{method_base_name}? :on_#{method_base_name}?
      alias :is_on_#{method_base_name}? :on_#{method_base_name}?
      alias :is_#{method_base_name}? :on_#{method_base_name}?
    ALIAS
  end

  # @!endgroup

  private

  def on_the_railway_line_of?( *args , compared: railway_line.same_as )
    compare_base( args , compared )
  end

end
