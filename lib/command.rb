require 'rubygems'
require 'commandline/optionparser'
include CommandLine

class Command
    # Command name
    attr_reader :command

    # Command options
    attr_reader :options

    # Command default options
    attr_accessor :defaults

    # Short description of the command
    attr_accessor :summary

    # Command name for command-line invocation
    attr_accessor :program_name

    # Initializes a timemaniac command `timemaniac command options`
    def initialize(command, summary=nil, defaults={})
        @command = command
        @summary = summary
        @program_name = "timemaniac #{command}"
        @defaults = defaults
        @options  = defaults.dup
    end

    def execute
        raise 'Timemaniac command has no actions.'
    end
end

module Commands
end

# Require every commands here
require 'lib/commands/list_command'
