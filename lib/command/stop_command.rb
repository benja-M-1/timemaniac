module Commands
  class StopCommand < Command
    def initialize
      super('stop', 'Stop an entry.')
    end

    def configure
      super
      @parser.banner = "Timemaniac - Stop an entry"

      @parser.on('-n', '--name NAME', 'Name of the entry') do |name|
        @options[:name] = name
      end
    end

    def execute(args={})
      raise OptionParser::MissingArgument.new('You have to provide a name to your entry.') if @options[:name].nil?

      entry = Timemaniac::Entry.first(:name => @options[:name])
      entry.stop
      entry.save

      puts "#{entry.name} is stopped (#{entry.elapsed_time_to_s})"
    end
  end
end