module Commands
  class StartCommand < Command
    def initialize
      super('start', 'Start an entry.')
    end

    def configure
      super
      @parser.banner = "Timemaniac - Start an entry"

      @parser.on('-n', '--name NAME', 'Name of the entry') do |name|
        @options[:name] = name
      end
    end

    def execute(args={})
      raise OptionParser::MissingArgument.new('You have to provide a name to your entry.') if @options[:name].nil?

      entry = Timemaniac::Entry.first(:name => @options[:name])
      entry.start
      entry.save

      puts "#{entry.name} is started."
    end
  end
end