module TokyoMetro::Modules::ToFactory::Common::Seed::List

  extend ActiveSupport::Concern
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::Group

  module ClassMethods

    def factory_for_seeding_instance_of_this_class
      factory_for_seeding_list
    end

  end

end
