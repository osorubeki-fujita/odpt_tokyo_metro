# 鉄道事業者の情報を扱うクラスの名称を提供するモジュール
module TokyoMetro::ClassNameLibrary::Static::Operator

  extend ::ActiveSupport::Concern

  module ClassMethods

    def toplevel_namespace
      ::TokyoMetro::Static::Operator
    end

    def hash_class
      ::TokyoMetro::Static::Operator::Hash
    end

    def info_class
      ::TokyoMetro::Static::Operator::Info
    end

    def name_class
      ::TokyoMetro::Static::Operator::Info::Name
    end

    def additional_infos_class
      ::TokyoMetro::Static::Operator::Info::AdditionaInfos
    end

    def code_settings_class
      ::TokyoMetro::Static::Operator::Info::AdditionaInfos::CodeSettings
    end

    def factory_for_generating_from_saved_file
      ::TokyoMetro::Factory::Generate::Static::Operator::Hash
    end

    def factory_for_generating_from_hash
      ::TokyoMetro::Factory::Generate::Static::Operator::Info
    end

    def factory_for_generating_instance_of_name
      ::TokyoMetro::Factory::Generate::Static::Operator::Info::Name
    end

    def factory_for_generating_instance_of_additional_infos
      ::TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionaInfos
    end

    def factory_for_generating_instance_of_code_settings
      ::TokyoMetro::Factory::Generate::Static::Operator::Info::AdditionaInfos::CodeSettings
    end

    def factory_for_seeding_hash
      ::TokyoMetro::Factory::Seed::Static::Operator::Hash
    end

    def factory_for_seeding_info
      ::TokyoMetro::Factory::Seed::Static::Operator::Info
    end

    def factory_for_seeding_code_info
      ::TokyoMetro::Factory::Seed::Static::Operator::Info::CodeInfo
    end

    def db_instance_class
      ::Operator::Info
    end

    def db_instance_class_of_code_info
      ::Operator::CodeInfo
    end

    private

    def yaml_file_basename
      "operator/info"
    end

  end

end
