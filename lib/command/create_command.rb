module Commands
  class CreateCommand < Command
    def initialize
      super('create', 'Create entries : create a entry.')
    end

    def configure
      super
      @parser.banner = "Timemaniac - Create an entry"

      @parser.on('-n', '--name NAME', 'Name of the entry') do |name|
        @options[:name] = name
      end

      @parser.on('-d', '--description DESCRIPTION', 'Description of the entry') do |description|
        @options[:description] = description
      end

      @parser.on('-s', '--start', 'Starts the entry immediatly.') do |start|
        @options[:start] = start
      end
    end

    def execute(args={})
      raise OptionParser::MissingArgument.new('You have to provide a name to your entry.') if @options[:name].nil?

      entry = Timemaniac::Entry.create(:name => @options[:name], :description => @options[:description])
      entry.save

      puts "#{entry.name} has been created."

      if @options[:start]
        entry.start
        puts "#{entry.name} is now running."
      end

    end
  end
end