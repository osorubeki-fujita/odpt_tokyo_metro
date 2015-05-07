module TokyoMetro::Factory::Convert::Patch::ForString::BarrierFreeFacility::PlaceName

  def process
    str = self.zen_num_to_han
    str = str.convert_comma_between_number_to_dot
    str = str.gsub( "東部スカイツリーライン" , "東武スカイツリーライン" )
    str = str.gsub( /(?<=出) ?(?=入口)/ , "" )
    str = str.gsub( /[ 　]?（([a-zA-z\d]+)）/ ) { " (#{ $1 })" }
    str
  end

end