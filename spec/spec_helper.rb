require 'rack/test'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'factory_bot'
require 'support/factory_bot'

ENV['RACK_ENV'] ||= 'test'

$: << File.expand_path('../..', __FILE__)
require 'snippets'

module RSpecMixin
  include Rack::Test::Methods
  def app() SnippetApp end
end

Capybara.app = SnippetApp

RSpec.configure do |config|
  config.include RSpecMixin 
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
end
