class TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos::Info < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Normal

  include ::TokyoMetro::ClassNameLibrary::Api::StationFacility

  def process
    replacing_dictionary = ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos.replacing_railway_lines
    ignored_dictionary = nil

    @object.platform_infos.each do | platform_info |
      if platform_info.transfer_infos.present?
        ary = self.class.platform_transfer_list_class.new

        platform_info.transfer_infos.each do | transfer_info |
          ::TokyoMetro::Factory::Convert::Customize::Api::StationFacility::RailwayLineNameInPlatformTransferInfos::Info::EachTransferInfo.process( transfer_info , ary , replacing_dictionary , ignored_dictionary , @object.same_as )
        end

        platform_info.instance_eval do
          @transfer_infos = ary
        end

      end
    end
  end

end
