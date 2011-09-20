class CommandRunner
  attr_reader :command_manager_class

  def initialize(options={})
    @command_manager_class = options[:command_manager] || CommandManager
  end

  def run(args=[])
    raise ArgumentError, "No arguments found." if args.empty?
    command = args.shift

    manager = @command_manager_class.instance
    manager[command].execute(args)
  end
end
