# @note
#   TokyoMetro::Modules::Common::ConvertConstantToClassMethod の TokyoMetro への include は、
#    tokyo_metro/modules/common/convert_constant_to_class_method.rb で行う。
module TokyoMetro::Initializer::Modules

  def self.set
    module_library.each do | module_type , categories |
      categories.each do | category , base_namespaces |
        [ base_namespaces ].flatten.each do | base_namespace |
          namespace = eval( "::TokyoMetro::Modules::Api::ToFactory::Convert::#{ module_type }::#{ category }::#{ base_namespace }")
          namespace.set_modules
        end
      end
    end

    return nil
  end

  class << self

    private

    def module_library
      h = ::Hash.new

      #---------------- StationTimetable, TrainTimetable ...
      # Patch と Customize で共通して用いるモジュール

      set_namespaces( h , :Common , :TrainInfos ,
        :ConvertStation ,
        :ConvertTerminalStation ,
        :ConvertStartingStation
      )

      set_namespaces( h , :Common , :StationTimetable ,
        :ConvertTerminalStations
      )

      #---------------- Patch

      set_namespaces( h , :Patch , :Station ,
        :ConnectingRailwayLine
      )

      set_namespaces( h , :Patch , :StationFacility ,
        :EscalatorDirection ,
        :EscalatorOperationDay ,
        :PlatformTransferInfoAtKudanshita ,
        :BarrierFreeFacilityLocatedArea ,
        :SurroundingArea
      )

      set_namespaces( h , :Patch , :TrainInfos ,
        :MusashiKosugiInNambokuLine
      )

      set_namespaces( h , :Patch , :StationTimetable ,
        :MusashiKosugiInNambokuLine ,
        :NakanoSakaueOnMarunouchiBranchLine ,
        :Origin ,
        :FukutoshinLineForWakoshi ,
        :MarunouchiBranchLineForNakanoSakaue
      )

      set_namespaces( h , :Patch , :TrainTimetable ,
        :YurakuchoLine
      )

      set_namespaces( h , :Patch , :TrainLocation ,
        :ChiyodaMainLine
      )

      #---------------- Customize

      set_namespaces( h , :Customize , :Fare ,
        :ChiyodaBranchLine
      )

      set_namespaces( h , :Customize , :RailwayLine ,
        :ChiyodaBranchLine
      )

      set_namespaces( h , :Customize , :Station ,
        :ChiyodaBranchLine ,
        :StationCodeOfNakanoSakaueOnMarunouchiBranchLine ,
        :ConnectingRailwayLine
      )

      set_namespaces( h , :Customize , :StationFacility ,
        :RailwayLineNameInPlatformTransferInfos ,
        :PlatformTransferInfoAtNakanoSakaue ,
        :MarunouchiBranchLine ,
        :ChiyodaBranchLine
      )

      set_namespaces( h , :Customize , :TrainTimetable ,
        # :MarunouchiBranchLine ,
        :TrainRelationsOnMarunouchiBranchLine ,
        :ChiyodaBranchLine ,
        :RomanceCar ,
        :ToeiMitaLine ,
        :StartingStation ,
        :TerminalStation
      )

      set_namespaces( h , :Customize , :StationTimetable ,
        # :MarunouchiBranchLine ,
        :ChiyodaBranchLine ,
        :AdditionalInfos ,
        :TerminalStation
      )

      set_namespaces( h , :Customize , :TrainLocation ,
        :ChiyodaBranchLine ,
        :MarunouchiBranchLine ,
        :RomanceCar ,
        :ToeiMitaLine ,
        :TerminalStation
      )

      set_namespaces( h , :Customize , :TrainInfos ,
        :ConvertStation ,
        :ConvertStartingStation
      )

      h
    end

    def set_namespaces( h , module_type , category , *namespaces )
      if h[ module_type ].nil?
        h[ module_type ] = ::Hash.new
      end
      if h[ module_type ][ category ].nil?
        h[ module_type ][ category ] = ::Array.new
      end
      namespaces.flatten.each do | namespace |
        h[ module_type ][ category ] << namespace
      end
    end

  end

end
