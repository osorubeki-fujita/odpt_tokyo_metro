class TokyoMetro::Factory::Convert::Customize::Api::Station::ChiyodaBranchLine::Generate::List < TokyoMetro::Factory::Convert::Common::Api::MetaClass::Fundamental::Updated

  def initialize( object )
    super( object )
    @ayase_main = @object.find { | item |
      item.same_as == ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ayase_on_chiyoda_main_line
    }
    @kita_ayase = @object.find { | item |
      item.same_as == ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kita_ayase_on_chiyoda_main_line
    }
    initialize_ayase_branch
  end

  private

  def initialize_ayase_branch
    if @ayase_main.present?
      @ayase_branch = ::Marshal.load( ::Marshal.dump( @ayase_main ) )
    end
  end

  def process
    if @ayase_main.present?
      add_connecting_railway_line_infos
      update_ayase_branch
      @object << @ayase_branch
    end
    update_kita_ayase
  end

  def connecting_railway_line_info_on_main_line
    ::TokyoMetro::Factory::Generate::Api::Station::List.connecting_railway_line_info_class.new(
      ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.chiyoda_branch_same_as ,
      hidden_on_railway_line_page: true
    )
  end

  def connecting_railway_line_info_on_branch_line
    ::TokyoMetro::Factory::Generate::Api::Station::List.connecting_railway_line_info_class.new(
      ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.chiyoda_same_as ,
      hidden_on_railway_line_page: true
    )
  end

  def add_connecting_railway_line_infos
    @ayase_main.connecting_railway_line_infos << connecting_railway_line_info_on_main_line
    @ayase_branch.connecting_railway_line_infos << connecting_railway_line_info_on_branch_line

    [ @ayase_main , @ayase_branch ].each do | item |
      item.connecting_railway_line_infos.set_index_in_station!.sort!
    end
  end

  def update_ayase_branch
    @ayase_branch.instance_eval do
      @same_as = ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.ayase_on_chiyoda_branch_line
      @railway_line = ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.chiyoda_branch_same_as
      @id_urn = nil
      @dc_date = nil
    end
  end

  def update_kita_ayase
    if @kita_ayase.present?
      @kita_ayase.instance_eval do
        @same_as = ::TokyoMetro::Modules::Dictionary::Common::Station::StringInfo.kita_ayase_on_chiyoda_branch_line
        @railway_line = ::TokyoMetro::Modules::Dictionary::Common::RailwayLine::StringInfo.chiyoda_branch_same_as
      end
    end
  end

end
