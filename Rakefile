require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'
require './snippets'

task default: ['ci:all']

desc 'Run Unit Tests'
RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

