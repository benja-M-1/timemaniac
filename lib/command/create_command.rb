module Commands
  class CreateCommand < Command
    def initialize
      super('create', 'Create tasks : create a task.')
    end

    def configure
      super
      @parser.banner = "test"

      @parser.on('-n', '--name NAME', 'Name of the task') do |name|
        @options[:name] = name
      end

      @parser.on('-d', '--description DESCRIPTION', 'Description of the task') do |description|
        @options[:description] = description
      end

      @parser.on('-s', '--start', 'Starts the task immediatly.') do |start|
        @options[:start] = start
      end
    end

    def execute(args={})
      raise OptionParser::MissingArgument.new('You have to provide a name to your task.') if @options[:name].nil?

      entry = Timemaniac::Entry.create(:name => @options[:name], :description => @options[:description])
      entry.save

      entry.start if @options[:start]
    end
  end
end