def set_tasks_to_loop_for_saving_real_time_infos
  namespace :tokyo_metro do
    namespace :loop do
      desc "リアルタイム情報の定期的な取得（繰り返し）"
      task :saving_real_time_infos => :load do
        TokyoMetro::Factory::Save::Api::RealtimeInfos.begin_loop
      end
    end
  end
end
