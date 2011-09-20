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
require 'lib/timemaniac'
require 'lib/command'
require 'lib/command_runner'
require 'lib/command_manager'