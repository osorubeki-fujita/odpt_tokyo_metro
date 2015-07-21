namespace :tokyo_metro do
  namespace :make do

    desc "ドキュメント生成に関するファイルのロード"
    task :load_scripts_related_to_document do
      require 'fileutils'
      load 'C:/Users/Fujita Shu/Dropbox/Program/Ruby/common_settings.rb'
      load "#{ ::Rails.root }/lib/tokyo_metro.rb"
      load "#{ ::Rails.root }/lib/tokyo_metro/document.rb"
      Dir.glob( "#{ ::Rails.root }/lib/tokyo_metro/document/**/**.rb" ).sort.each do | file |
        load file
      end
    end

    namespace :document do

      desc "YARD によるドキュメント生成"
      task :yard => :load_scripts_related_to_document do
        ::TokyoMetro::Rake::Make::Document::Yard.process( verbose: true )
      end

      namespace :gviz do
        desc "Ruby のクラス図の生成"
        task :ruby_graph => :load_scripts_related_to_document do
          ::TokyoMetro::Rake::Make::Document::Gviz::RubyGraph.process
        end

        desc "ファイルの階層図の生成"
        task :dir_graph => :load_scripts_related_to_document do
          ::TokyoMetro::Rake::Make::Document::Gviz::DirGraph.process( dot_files: true , db_dot_files: true )
        end

        desc "画像ファイルの生成（dot ファイルを変換）"
        task :convert_images => :load_scripts_related_to_document do
          ::TokyoMetro::Rake::Make::Document::Gviz::ConvertToImage.process( include_ruby_classes: false )
        end
      end

    end

    namespace :examples do
      desc "ドキュメント内で使用する例の作成"
      task :static => :load do
        ::TokyoMetro.set_fundamental_constants
        ::TokyoMetro::Rake::Make::Document::Examples::Static.process
      end
    end

    desc "駅名辞書の生成 (YAML <- CSV)"
    task :yaml_station_list => :load do
      ::TokyoMetro::Rake::Make::YamlStationList.process
    end

  end
end

# ::TokyoMetro::Rake::Make::Document::Gviz.set_dir
