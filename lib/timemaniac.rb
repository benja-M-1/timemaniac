$:.unshift File.dirname(__FILE__)

# stdlib
require 'yaml'

# rubygems
require 'rubygems'
require 'optparse'
require 'logger'
require 'sequel'

# timemaniac
require 'timemaniac/version'
require 'timemaniac/command'
require 'timemaniac/command_manager'
require 'timemaniac/command_runner'

module Timemaniac
    DB = nil
    def self.setup
        file = File.new('db/config/database.yml').read
        settings = YAML::load(file)
        database = settings['default']
        logger   = Logger.new(settings['log'])
        DB = Sequel.connect({:adapter => database['adapter'], :host => database['host'], :logger => logger})
    end
end

Timemaniac.setup()

require 'timemaniac/model'
