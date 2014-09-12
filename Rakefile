require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

if ENV["APPRAISAL_INITIALIZED"] || ENV["CI"]
  task default: :spec
else
  task :default do
    exec "bundle exec appraisal rake spec"
  end
end

