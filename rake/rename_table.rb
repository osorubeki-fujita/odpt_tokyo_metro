def set_tasks_to_check_namespaces

  namespace :tokyo_metro do
    namespace :check_namespaces do

      desc "名前空間の名称のチェック"
      task :rename_table do
        filenames = ::TokyoMetro::Rake::CheckNamespace::RenameTable.filenames

        namespaces = ARGV[1..-1].delete_if { |v| /\A-/ === v }
        puts namespaces.to_s

        namespaces.each do | namespace |
          ::TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace.new( namespace , filenames ).search.display
        end
        
        a = nil
      end

    end
  end

end