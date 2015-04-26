require "bundler/gem_tasks"
require "rspec/core/rake_task"

require_relative "lib/tokyo_metro.rb"
require_relative "rake/rename_table.rb"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

set_tasks_to_check_namespaces