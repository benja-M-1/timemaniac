module Commands
  class ListCommand < Command
    def initialize
      super('list', 'List tasks : lists the user\'s tasks.')
    end

    def configure
      super
      @parser.banner = "Timemaniac - List the entries."
    end

    def execute(args=[])
      entries = get_entries
      puts 'You have no entries stored for this moment.' if entries.empty?
      entries.each do |entry|
        puts entry.to_s
      end
    end

    def get_entries
      entries = Timemaniac::Entry.all() #:status => Timemaniac::Timer.status('stopped'))
    end
  end
end