require 'rack/test'
require 'rspec'
require 'sinatra'
require 'vcr'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
