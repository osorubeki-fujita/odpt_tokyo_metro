module TokyoMetro::App::Db::Dictionary::Models

  def self.init
    const_set( :GROUP , ::YAML.load_file( "#{ ::TokyoMetro::RAILS_DIR }/lib/models.yaml" ) )
  end

  def self.list
    make_list( GROUP )
  end

  def self.list_sort_by_alphabet
    make_list( { "All" => GROUP.values.flatten.sort } )
  end

  class << self

    private

    def make_list(h)
      model_ary = ::Array.new
      h.each do | category , models |
        models.each.with_index(1) do | model , i |
          if i == 1
            category_name = category
          else
            category_name = nil
          end

          model_ary << { category: category_name , model: model , count: eval( "::#{ model }.all.count" ) }
        end
      end
      model_ary
    end

  end

end
