class TokyoMetro::Factory::Convert::Customize::Api::MetaClass::TrainInfos::ToeiMitaLine::Info

  def initialize( object )
    @object = object
  end

  attr_reader :object

  def process
    convert_railway_line
    convert_operator
    convert_railway_direction
    convert_train_type
  end

  def self.process( object )
    self.new( object ).process
  end

  private

  def convert_railway_line
    object.instance_variable_set( :@railway_line , "odpt.Railway:Toei.Mita" )
  end

  def convert_operator
    object.instance_variable_set( :@operator , "odpt.Operator:Toei" )
  end

  def convert_railway_direction
    case object.railway_direction
    when "odpt.RailDirection:TokyoMetro.Meguro"
      railway_direction_new = "odpt.RailDirection:Toei.Meguro"
    when "odpt.RailDirection:TokyoMetro.ShirokaneTakanawa"
      railway_direction_new = "odpt.RailDirection:Toei.NishiTakashimadaira"
    end
    object.instance_variable_set( :@railway_direction , railway_direction_new )
  end

  def convert_train_type
    case object.train_type
    when "odpt.TrainType:TokyoMetro.Local"
      train_type_new = "odpt.TrainType:Toei.Local"
    when "odpt.TrainType:TokyoMetro.Express"
      train_type_new = "odpt.TrainType:Toei.Express"
    end
    object.instance_variable_set( :@train_type , train_type_new )
  end

end
