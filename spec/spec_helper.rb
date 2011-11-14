$:.push File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'simplecov'
require 'rspec'
require 'timemaniac'

SimpleCov.start do
    # Filtered files are ignored
    add_filter '/spec/'

    # Grouped files
    add_group 'Executable', 'bin'
    add_group 'Model', 'lib/timemaniac/model'
    add_group 'Cli', 'lib/timemaniac/command'
end

RSpec.configure do |config|
  config.mock_framework = :mocha
end

