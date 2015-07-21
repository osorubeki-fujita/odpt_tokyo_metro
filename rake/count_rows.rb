def set_tasks_to_count_rows
  namespace :tokyo_metro do
    desc "コードの行数の取得"
    task :count_rows do
      files = [
=begin
        "#{ ::Rails.root }/../rails_tokyo_metro_dev/tsukaisute/**/**.rb" ,
        "#{ ::Rails.root }/../rails_tokyo_metro_db/**.txt" ,
        "#{ ::Rails.root }/../rails_tokyo_metro_db/additional_datas/**/**.yaml" ,
        "#{ ::Rails.root }/../rails_tokyo_metro_db/dictionary/**/**.yaml" ,
        "#{ ::Rails.root }/app/**/**.rb" ,
        "#{ ::Rails.root }/app/**/**.haml" ,
        "#{ ::Rails.root }/app/**/**.scss" ,
        "#{ ::Rails.root }/app/**/**.js" ,
        "#{ ::Rails.root }/db/seeds.rb" ,
        "#{ ::Rails.root }/db/seeds/**/**.rb" ,
        "#{ ::Rails.root }/lib/**/**.rb" ,
        "#{ ::Rails.root }/lib/**/**.yaml" ,
        "#{ ::Rails.root }/lib/**/**.rake" ,
        "#{ ::Rails.root }/test/tokyo_metro/**/**.rb" ,
        "#{ ::Rails.root }/config/application.rb" ,
        "#{ ::Rails.root }/config/application/**/**.rb" ,
        "#{ ::Rails.root }/Rakefile"
=end
        "#{ ::Rails.root }/app/helpers/**/**.rb" ,
      ].map { | str | Dir.glob( str ) }.flatten.sort

      ::PositiveCodeCounter.process( files )
    end
  end
end
