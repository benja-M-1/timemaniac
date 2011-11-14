module Timemaniac
    module Commands
        class StartCommand < Timemaniac::Command
            def initialize
                super('start', 'Start an task.')
            end

            def configure
                super
                @parser.banner = "Timemaniac - Start an task"

                @parser.on('-n', '--name NAME', 'Name of the task') do |name|
                    @options[:name] = name
                end
            end

            def execute(args={})
                raise OptionParser::MissingArgument.new('You have to provide a name to your task.') if @options[:name].nil?

                task = Timemaniac::Model::Task.first(:name => @options[:name])
                debugger
                raise "Task #{@options[:name]} not found." if task.nil?
                task.start
                task.save

                puts "#{task.name} is started."
            end
        end
    end
end
