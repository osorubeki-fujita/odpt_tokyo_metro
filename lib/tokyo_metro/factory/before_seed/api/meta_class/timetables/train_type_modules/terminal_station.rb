module TokyoMetro::Factory::BeforeSeed::Api::MetaClass::Timetables::TrainTypeModules::TerminalStation

  include ::TokyoMetro::Modules::Decision::Common::Station::Terminal

  def bound_for?( *list_of_train_terminal_station , compared: @terminal_station_info_in_db.same_as )
    super( list_of_train_terminal_station , compared )
  end

  #-------- [alias]
  alias :is_bound_for? :bound_for?
  alias :is_terminating? :bound_for?
  alias :terminate? :bound_for?

end
