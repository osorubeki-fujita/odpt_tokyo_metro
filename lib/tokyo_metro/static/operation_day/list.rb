class TokyoMetro::Static::OperationDay::List < Array

  include ::TokyoMetro::ClassNameLibrary::Static::OperationDay
  include ::TokyoMetro::Modules::ToFactory::Common::Seed::List

  def method_missing( method_name , *args )
    info = self.find { | item | item.try( :match? , method_name ) }
    if info.present?
      return info
    else
      return super( method_name , *args )
    end
  end

end
