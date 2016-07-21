require 'rack/test'
require 'rspec'
require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../app.rb', __FILE__)

Capybara.app = Sinatra::Application

module RSpecMixin
  include Rack::Test::Methods
  include Capybara::DSL
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
