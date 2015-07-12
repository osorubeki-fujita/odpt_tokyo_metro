require "bundler/gem_tasks"
require "rspec/core/rake_task"

# require_relative "lib/tokyo_metro.rb"

require_relative "rake/count_rows.rb"
require_relative "rake/loop.rb"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

set_tasks_to_count_rows
set_tasks_to_loop_for_saving_real_time_infos
