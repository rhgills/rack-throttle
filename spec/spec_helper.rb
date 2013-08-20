require 'rspec'
require "rack/test"
require "rack/throttle"
require_relative 'spec_helpers'

RSpec.configure do |c|
  c.include(SpecHelpers)
  c.include(Rack::Test::Methods)
end


