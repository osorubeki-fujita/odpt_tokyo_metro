class TokyoMetro::Factory::Convert::Common::Api::StationFacility::BarrierFree::Facility::Escalator < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  def initialize( object , generator_instance )
    super( object )
    @generator_instance = generator_instance
  end

  def process
    if to_process?
      # puts self.class.name
      # puts same_as

      replace_infos
    end
  end

  private

  def hash_in_generator_instance
    @generator_instance.instance_variable_get( :@hash )
  end

  def same_as
    hash_in_generator_instance[ "owl:sameAs" ]
  end

  def replace_infos
    raise "This method '#{ __method__ }' is not defined yet in this class '#{ self.class }'."
  end

  def service_details_after_prepending_patch_module( module_name , proc = nil )
    service_detail_ary_new = hash_in_generator_instance[ "odpt:serviceDetail" ].map { | info_h |
      factory_instance = self.class.factory_for_generating_barrier_free_escalator_service_detail_from_hash.new( info_h )
      # puts "★ " + same_as
      if proc.nil? or ( proc.present? and proc.call( info_h ) )
        eval <<-PREPEND
          class << factory_instance
            prepend ::#{ module_name }
          end
        PREPEND
      end
      factory_instance.generate
    }

    return self.class.barrier_free_service_detail_list_class.new( service_detail_ary_new )
  end

end
