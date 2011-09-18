#!/usr/bin/env ruby

# Require lib classes
require 'lib/command_runner'
require 'rubygems'
require 'ruby-debug'

runner = CommandRunner.new
begin
    runner.run(ARGV.clone)
rescue Exception => e
    puts e.to_s
    exit 1
end
