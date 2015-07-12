module TokyoMetro::Factory::Seed::Reference::TrainType

  def train_type_info_id( *args , determine_by: @info.train_type )
    self.class.train_type_factory.id_in_db( determine_by , *args )
  end

  def train_type_infos( whole = nil ,
    __railway_line_id__: railway_line_id ,
    __in_api_id__: in_api_id
  )
    h = {
      railway_line_id: __railway_line_id__ ,
      in_api_id: __in_api_id__
    }

    if whole.present?
      whole.where(h)
    else
      ::TrainType::Info.where(h)
    end
  end

end
