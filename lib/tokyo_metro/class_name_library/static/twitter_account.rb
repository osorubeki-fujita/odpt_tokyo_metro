# Twitter アカウントを扱うクラスの名称を提供するモジュール
module TokyoMetro::ClassNameLibrary::Static::TwitterAccount

  extend ::ActiveSupport::Concern

  module ClassMethods

    def toplevel_namespace
      ::TokyoMetro::Static::TwitterAccount
    end

    def info_class
      ::TokyoMetro::Static::TwitterAccount::Info
    end

    def factory_for_generating_from_hash
      ::TokyoMetro::Factory::Generate::Static::TwitterAccount::Info
    end

    def factory_for_seeding_info
      ::TokyoMetro::Factory::Seed::Static::TwitterAccount::Info
    end

    def db_instance_class
      ::TwitterAccount
    end

  end

end
