class TokyoMetro::Initializer::ApiKey::List < Array

  def set
    self.each do | namespace |
      namespace.set
    end
  end

end
