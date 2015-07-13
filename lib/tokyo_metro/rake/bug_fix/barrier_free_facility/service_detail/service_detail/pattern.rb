class TokyoMetro::Rake::BugFix::BarrierFreeFacility::Pattern

  def initialize( title , facility_names , proc_for_deciding_invalidity )
    puts title

    @facility_names = [ facility_names ].flatten
    @proc_for_deciding_invalidity = proc_for_deciding_invalidity
    @facility_info_ids = []
    @invalid_service_detail_pattern_id = nil

    set_facility_info_ids
    set_invalid_service_detail_pattern
    set_facility_info_ids_related_to_invalid_pattern
  end

  def process( info_for_updating , h_for_updating , proc_for_creating_h_for_new_pattern_instance , to_test )
    if to_update_pattern_instance?
      puts "Update - Begin"
      unless info_for_updating.present?
        raise "Info for updating is not present."
      end
      unless to_test
        @invalid_service_detail_pattern.update( h_for_updating )
      end
      puts "Update instance"
      puts "by #{ h_for_updating }"
      puts "Update - Complete"

    else
      puts "Create new instance - Begin"
      h_for_new_pattern_instance = proc_for_creating_h_for_new_pattern_instance.call( info_for_updating , @invalid_service_detail_pattern )
      new_pattern_instance = ::BarrierFreeFacilityServiceDetailPattern.find_by( h_for_new_pattern_instance )
      unless new_pattern_instance.present?
        new_pattern_instance = ::BarrierFreeFacilityServiceDetailPattern.create( h_for_new_pattern_instance.merge({
          id: ::BarrierFreeFacilityServiceDetailPattern.all.pluck(:id).max + 1
        }))
        puts "A new instance is created."
      end

      ::BarrierFreeFacilityServiceDetail.where(
        info_id: @facility_info_ids ,
        barrier_free_facility_service_detail_pattern_id: @invalid_service_detail_pattern_id
      ).to_a.each do | service_detail |
        puts "Update service_detail instance \##{ service_detail.id } (barrier_free_facility_service_detail_pattern_id: #{ new_pattern_instance.id })"
        unless to_test
          service_detail.update( barrier_free_facility_service_detail_pattern_id: new_pattern_instance.id )
        end
      end

      puts "Create new instance - Complete"
    end
  end

  def self.process( title , facility_names , proc_for_deciding_invalidity , info_for_updating , h_for_updating , proc_for_creating_h_for_new_pattern_instance , to_test: true )
    self.new( title , facility_names , proc_for_deciding_invalidity ).process( info_for_updating , h_for_updating , proc_for_creating_h_for_new_pattern_instance , to_test )
  end

  private

  def set_facility_info_ids
    @facility_names.each do | facility_name |
      facility = ::BarrierFreeFacility::Info.find_by( same_as: facility_name )
      unless facility.present?
        raise "\"#{ facility_name }\" is not present."
      end
      @facility_info_ids << facility.id
    end
    @facility_info_ids.sort!

    puts "facility_info_ids: #{ @facility_info_ids.to_s }"
  end

  def set_invalid_service_detail_pattern
    @facility_info_ids.each do | facility_info_id |
      facility_info = ::BarrierFreeFacility::Info.find( facility_info_id )
      service_details = facility_info.service_details
      service_details.each.with_index(1) do | detail_info , i |
        pattern = detail_info.barrier_free_facility_service_detail_pattern

        if @proc_for_deciding_invalidity.call( pattern )
          if @invalid_service_detail_pattern_id.blank?
            @invalid_service_detail_pattern_id = pattern.id
          elsif @invalid_service_detail_pattern_id != pattern.id
             raise "Pattern \#1 of \"#{ facility_info.same_as }\" is not valid."
          end
        end

      end
    end

    @invalid_service_detail_pattern = ::BarrierFreeFacilityServiceDetailPattern.find( @invalid_service_detail_pattern_id )
    puts "invalid_service_detail_pattern_id: #{ @invalid_service_detail_pattern_id }"
  end

  def set_facility_info_ids_related_to_invalid_pattern
    @facility_info_ids_related_to_invalid_pattern = ::BarrierFreeFacilityServiceDetailPattern.find( @invalid_service_detail_pattern_id ).barrier_free_facility_infos.pluck( :id ).sort
    puts "facility_info_ids_related_to_invalid_pattern: #{ @facility_info_ids_related_to_invalid_pattern }"
  end

  def to_update_pattern_instance?
    @facility_info_ids_related_to_invalid_pattern == @facility_info_ids
  end

end
