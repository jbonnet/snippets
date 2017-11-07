require 'rack/test'
require 'rspec'
require'capybara/rspec'

ENV['RACK_ENV'] ||= 'test'

$: << File.expand_path('../..', __FILE__)
require 'snippets'

def app
  SnippetApp
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.mock_with :rspec
end
