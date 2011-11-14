module Timemaniac
    module Commands
        class CreateCommand < Timemaniac::Command
            def initialize
                super('create', 'Create entries : create a task.')
            end

            def configure
                super
                @parser.banner = "Timemaniac - Create an task"

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

                task = Timemaniac::Model::Task.create(:name => @options[:name], :description => @options[:description])
                if task.saved?
                    puts "#{task.name} has been created."

                    if @options[:start]
                        task.start
                        puts "#{task.name} is now running."
                    end
                end
            end
        end
    end
end
