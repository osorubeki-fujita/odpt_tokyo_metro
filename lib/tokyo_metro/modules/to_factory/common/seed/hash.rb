module TokyoMetro::Modules::ToFactory::Common::Seed::Hash

  extend ActiveSupport::Concern
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Group

  module ClassMethods

    # DB への流し込みに使用する Factory Pattern クラス
    # @note .factory_for_seeding_hash 以外を使用する場合は上書きする。
    def factory_for_seeding_instance_of_this_class
      factory_for_seeding_hash
    end

  end

end
