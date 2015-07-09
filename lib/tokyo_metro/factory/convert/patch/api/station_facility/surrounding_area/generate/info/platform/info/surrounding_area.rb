class TokyoMetro::Factory::Convert::Patch::Api::StationFacility::SurroundingArea::Generate::Info::Platform::Info::SurroundingArea < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  def process
    ary = ::Array.new
    @object.each do | item |
      place_name_new = ::TokyoMetro::Factory::Convert::Patch::Api::StationFacility::SurroundingArea.dictionary[ item ]
      if place_name_new.present?
        ary << place_name_new
      else
        ary << item
      end
    end
    @object = ary
  end

end
