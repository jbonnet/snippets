require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'
require './snippets'

task default: :spec

desc 'Run Unit Tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
  # t.rspec_opts << ' more options'
end
