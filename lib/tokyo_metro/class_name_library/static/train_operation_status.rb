# 列車運行情報の情報を扱うクラスの名称を提供するモジュール
module TokyoMetro::ClassNameLibrary::Static::TrainOperationStatus

  extend ::ActiveSupport::Concern

  module ClassMethods

    def toplevel_namespace
      ::TokyoMetro::Static::TrainOperationStatus
    end

    def list_class
      ::TokyoMetro::Static::TrainOperationStatus::List
    end

    def info_class
      ::TokyoMetro::Static::TrainOperationStatus::Info
    end

    def factory_for_generating_from_saved_file
      ::TokyoMetro::Factory::Generate::Static::TrainOperationStatus::List
    end

    def factory_for_generating_from_hash
      ::TokyoMetro::Factory::Generate::Static::TrainOperationStatus::Info
    end

    def factory_for_seeding_list
      ::TokyoMetro::Factory::Seed::Static::TrainOperationStatus::List
    end

    def factory_for_seeding_info
      ::TokyoMetro::Factory::Seed::Static::TrainOperationStatus::Info
    end

    def db_instance_class
      ::TrainOperation::Status
    end

    private

    def yaml_file_basename
      "train_operation_status"
    end

  end

end
