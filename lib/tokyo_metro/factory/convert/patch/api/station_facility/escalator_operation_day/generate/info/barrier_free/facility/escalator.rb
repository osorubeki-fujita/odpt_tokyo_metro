class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.4"
  CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 = "odpt.StationFacility:TokyoMetro.Chiyoda.Kasumigaseki.Outside.Escalator.5"

  GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1 = "odpt.StationFacility:TokyoMetro.Ginza.AkasakaMitsuke.Outside.Escalator.1"

  include ::TokyoMetro::Modules::Common::ConvertConstantToClassMethod

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  def initialize( object , generator_instance )
    super( object )
    @generator_instance = generator_instance
  end

  def process
    if to_process?
      puts self.class.name
      puts same_as

      case same_as
      when CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 , CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5
        proc_for_deciding_invalidity = ::Proc.new { | info_h |
          info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == "20:00" and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == "終車時" and info_h[ "odpt:operationDays" ].blank?
        }
        module_name = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::ChiyodaKasumigasekiOutsideEscalators
        @object = service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )

      when GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1
        proc_for_deciding_invalidity = ::Proc.new { | info_h |
          info_h[ "ugsrv:serviceStartTime" ].with_default_value( "始発" ) == "始発" and info_h[ "ugsrv:serviceEndTime" ].with_default_value( "終車時" ) == "終車時" and info_h[ "odpt:operationDays" ].blank?
        }
        module_name = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::EscalatorOperationDay::Generate::Info::BarrierFree::Facility::Escalator::ServiceDetail::GinzaAkasakaMitsukeOutsideEscalator
        @object = service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )
      end
    end
  end

  private

  def hash_in_generator_instance
    @generator_instance.instance_variable_get( :@hash )
  end

  def same_as
    hash_in_generator_instance[ "owl:sameAs" ]
  end

  def facility_names
    [
      CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_4 ,
      CHIYODA_KASUMIGASEKI_OUTSIDE_ESCALATOR_5 ,
      GINZA_AKASAKA_MITSUKE_OUTSIDE_ESCALATOR_1
    ]
  end

  def to_process?
    facility_names.include?( same_as )
  end

  def service_details_after_prepending_patch_module( proc_for_deciding_invalidity , module_name )
    service_detail_ary_new = hash_in_generator_instance[ "odpt:serviceDetail" ].map { | info_h |
      factory_instance = self.class.factory_for_generating_barrier_free_escalator_service_detail_from_hash.new( info_h )
      if proc_for_deciding_invalidity.call( info_h )
        eval <<-PREPEND
          class << factory_instance
            prepend ::#{ module_name }
          end
        PREPEND
      end
      factory_instance.generate
    }

    self.class.barrier_free_service_detail_list_class.new( service_detail_ary_new )
  end

end
