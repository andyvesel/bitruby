require 'rack/test'
require 'rspec'
require 'vcr'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
end

RSpec.configure { |config| config.include RSpecMixin }

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end
