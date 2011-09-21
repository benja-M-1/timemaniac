class Command
    # Command name
    attr_reader :name

    # Command options
    attr_reader :options

    # Command default options
    attr_accessor :defaults

    # Short description of the command
    attr_accessor :summary

    # Command name for command-line invocation
    attr_accessor :program_name

    # Initializes a timemaniac command `timemaniac command options`
    def initialize(name, summary=nil, defaults={})
        @name    = name
        @summary = summary
        @program_name = "timemaniac #{name}"
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
