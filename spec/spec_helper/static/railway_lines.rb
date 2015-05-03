def static_railway_lines
  ::TokyoMetro::Static.railway_lines.each do | railway_line_name , info |

    describe ::TokyoMetro::Static::RailwayLine::Info do
      it "\'#{ railway_line_name }\' has attiribute \'same_as\' (String)" do
        expect( info.same_as ).to be_instance_of( ::String )
      end
      it "\'#{ railway_line_name }\' has attiribute \'name_ja\' (Array)" do
        expect( info.name_ja ).to be_instance_of( ::Array )
      end
      it "\'#{ railway_line_name }\' has attiribute \'name_en\' (Array)" do
        expect( info.name_en ).to be_instance_of( ::Array )
      end
      it "\'#{ railway_line_name }\' has attiribute \'index\' (number)" do
        expect( info.index ).to be_number
      end
      it "\'#{ railway_line_name }\' has attiribute \'operator\' (TokyoMetro::Static::Operator::Info)" do
        expect( info.operator ).to be_instance_of( ::TokyoMetro::Static::Operator::Info )
      end
    end

    if info.color.present?
      describe ::TokyoMetro::Static::RailwayLine::Info do
        it "\'#{railway_line_name}\' contains color info." do
          expect( info.color ).to be_instance_of( ::Array )
          # expect( info.color ).to be_instance_of( ::TokyoMetro::Static::Color )
        end
      end
    end

  end
end