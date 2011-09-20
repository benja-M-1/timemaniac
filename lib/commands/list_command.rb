class Commands::ListCommand < Command
    def initialize
        super('list', 'List tasks')
    end

    def execute(args=[])
        entries = get_entries
        puts entries.values
    end

    def get_entries
        entries = Timemaniac::Entries.new
        entries.append(Timemaniac::Entry.new('Task one', 'Task one description'))
        entries.append(Timemaniac::Entry.new('Task two', 'Task two description'))

        return entries
    end
end
