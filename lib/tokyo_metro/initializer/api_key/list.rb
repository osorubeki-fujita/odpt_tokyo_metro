class TokyoMetro::Initializer::ApiKey::List < Array

  def self.set
    self.each do | namespace |
      namespace.set
    end
  end

end
