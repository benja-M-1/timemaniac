require 'rubygems'
require 'bundler/setup'
begin
    Bundler.require(:default, :test)
rescue Bundler::BundlerError => e
    $stderr.puts e.message
    $stderr.puts "Run `bundle install` to install missing gems"

    exit e.status_code
end
require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
$:.unshift File.dirname(__FILE__)
require 'timemaniac'
