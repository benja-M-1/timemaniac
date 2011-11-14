module Timemaniac
    module Commands
        class ListCommand < Timemaniac::Command
            def initialize
                super('list', 'List tasks : lists the user\'s tasks.')
            end

            def configure
                super
                @parser.banner = "Timemaniac - List the entries."
            end

            def execute(args=[])
                tasks = Timemaniac::Model::Task.all() #:status => Timemaniac::Timer.status('stopped'))
                puts 'You have no entries stored for this moment.' if tasks.empty?
                tasks.each do |task|
                    puts task.to_s
                end
            end
        end
    end
end
