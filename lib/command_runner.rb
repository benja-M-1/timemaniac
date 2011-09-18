require 'lib/command_manager'

class CommandRunner
    def run(args=[])
        raise "No arguments found." if args.empty?
        command = args.shift

        manager = CommandManager.instance
        manager[command].execute(args)
    end
end
