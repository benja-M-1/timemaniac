# CommandRunner calls the executed command
# and passes options to it.
#
# @author Benjamin Grandfond <benjamin.grandfond@gmail.com>
module Timemaniac
    class CommandRunner
        attr_reader :command_manager_class

        def initialize(options={})
            @command_manager_class = options[:command_manager] || Timemaniac::CommandManager
        end

        def run(args=[])
            raise ArgumentError, "No arguments found." if args.empty?
            command = args.shift

            manager = @command_manager_class.instance
            manager[command].run(args)
        end
    end
end
