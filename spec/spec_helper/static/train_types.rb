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

  train_types_and_class_classes = [


  ]

  describe ::TokyoMetro::Static::TrainType::Custom::Main::Info , 'css_class_name' do
    ::TokyoMetro::Static.train_types.each do | train_type_name , info |
      same_as , valid_css_class_name = train_types_and_class_classes.find { | same_as , css_class_name | same_as == train_type_name }
      it "has method 'css_class_name'" do
        expect( info.css_class_name ).to eq( valid_css_class_name )
      end
    end
  end

end
