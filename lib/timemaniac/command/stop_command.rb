module Timemaniac
    module Commands
        class StopCommand < Timemaniac::Command
            def initialize
                super('stop', 'Stop an task.')
            end

            def configure
                super
                @parser.banner = "Timemaniac - Stop a task"

                @parser.on('-n', '--name NAME', 'Name of the task') do |name|
                    @options[:name] = name
                end
            end

            def execute(args={})
                raise OptionParser::MissingArgument.new('You have to provide a name to your task.') if @options[:name].nil?

                task = Timemaniac::Model::Task.first(:name => @options[:name])
                task.stop
                task.save

                puts "#{task.name} is stopped (#{task.elapsed_time_to_s})"
            end
        end
    end
end
