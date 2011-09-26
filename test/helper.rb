require 'rubygems'
require 'bundler/setup'
require 'test/unit'
begin
    Bundler.require(:default, :test)
rescue Bundler::BundlerError => e
    $stderr.puts e.message
    $stderr.puts "Run `bundle install` to install missing gems"

    exit e.status_code
end

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
$:.unshift File.dirname(__FILE__)

# @todo Create a specific Logger to handle the file to log in
# @todo Create a connect wrapper to ease the database connection and configuration (yml ;))
DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, 'sqlite3:db/timemaniac.db'

require 'lib/timemaniac'

DataMapper.finalize

require 'lib/command'
require 'lib/command_runner'
require 'lib/command_manager'