# 路線の情報を扱うクラスの名称を提供するモジュール
module TokyoMetro::ClassNameLibrary::Static::RailwayLine

  extend ::ActiveSupport::Concern

  module ClassMethods

    def toplevel_namespace
      ::TokyoMetro::Static::RailwayLine
    end

    # ハッシュのクラス
    # @return [Const (class name)]
    def hash_class
      ::TokyoMetro::Static::RailwayLine::Hash
    end

    # ハッシュの値のクラス
    # @return [Const (class name)]
    def info_class
      ::TokyoMetro::Static::RailwayLine::Info
    end

    def factory_for_generating_from_saved_file
      ::TokyoMetro::Factory::Generate::Static::RailwayLine::Hash
    end

    def factory_for_generating_from_hash
      ::TokyoMetro::Factory::Generate::Static::RailwayLine::Info
    end

    def factory_for_seeding_hash
      ::TokyoMetro::Factory::Seed::Static::RailwayLine::Hash
    end

    def factory_for_seeding_info
      ::TokyoMetro::Factory::Seed::Static::RailwayLine::Info
    end

    def factory_for_seeding_additional_infos_in_api
      ::TokyoMetro::Factory::Seed::Static::RailwayLine::Info::AdditionalInfo
    end

    def factory_for_seeding_code_infos
      ::TokyoMetro::Factory::Seed::Static::RailwayLine::Info::Code
    end

    def db_instance_class
      ::Railway::Line::Info
    end

    def db_instance_class_of_additional_info
      ::Railway::Line::AdditionalInfo
    end

    def db_instance_class_of_code_info
      ::Railway::Line::Code
    end

    def db_instance_class_of_info_code_info
      ::Railway::Line::InfoCodeInfo
    end

    private

    def yaml_file_basename
      "railway_line"
    end

  end

end
