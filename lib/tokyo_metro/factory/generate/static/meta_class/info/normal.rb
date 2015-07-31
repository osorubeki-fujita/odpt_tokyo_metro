class TokyoMetro::Factory::Generate::Static::MetaClass::Info::Normal < TokyoMetro::Factory::Generate::Static::MetaClass::Info::SubInfo

  def initialize( same_as , h )
    @same_as = same_as
    super(h)
  end

  private

  def variables
    # puts "variables: " + ( [ @same_as ] + variables_from_hash_keys ).to_s
    # puts "length: " + ( [ @same_as ] + variables_from_hash_keys ).length.to_s
    # puts ""
    [ @same_as ] + super
  end

end
