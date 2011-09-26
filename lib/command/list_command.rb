module Commands
  class ListCommand < Command
    def initialize
      super('list', 'List tasks : lists the user\'s tasks.')
    end

    def execute(args=[])
      entries = get_entries
      entries.each do |entry|
        puts entry.to_s
      end
    end

    def get_entries
      entries = Timemaniac::Entry.all(:status => Timemaniac::Timer.status('stopped'))
    end
  end
end