def static_train_types
  [ ::TokyoMetro::Static.train_types , ::TokyoMetro::Static.train_types_other_operator ].each do |h|
    h.each do | train_type_name , info |

      describe ::TokyoMetro::Static::TrainType::Custom::Main::Info do
        it "\'#{ train_type_name }) contains color info" do
          expect( info.color ).not_to be_instance_of( ::Array )
          expect( ( info.color.instance_of?( ::TokyoMetro::Static::Color ) or info.color.instance_of?( ::TokyoMetro::Static::TrainType::Color::Info ) ) ).to be_truthy
        end
        it "\'#{train_type_name}\' contains bgcolor info." do
          expect( info.bgcolor ).not_to be_instance_of( ::Array )
          expect( ( info.bgcolor.instance_of?( ::TokyoMetro::Static::Color ) or info.bgcolor.instance_of?( ::TokyoMetro::Static::TrainType::Color::Info ) ) ).to be_truthy
        end
      end

    end
  end
end