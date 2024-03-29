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

    attr_accessor :parser

    # Initializes a timemaniac command `timemaniac command options`
    def initialize(name, summary=nil, defaults={})
        @name    = name
        @summary = summary
        @program_name = "timemaniac #{name}"
        @defaults = defaults
        @options  = defaults.dup

        configure
    end

    def configure
      @parser = OptionParser.new('Timemaniac') if @parser.nil?
      @parser.on('-h', '--help', 'This the help')
    end

    def run(args={})
      @parser.parse!
      execute args
    end

    def execute(args={})
        raise 'Timemaniac command has no actions.'
    end
end

module Commands
end
