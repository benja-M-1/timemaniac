module Timemaniac
  class Entry
    include DataMapper::Resource

    property :id,          Serial
    property :name,        String
    property :description, Text
    property :status,      Integer
    property :created_at,  DateTime
    property :started_at,  DateTime
    property :finished_at, DateTime

    attr_accessor :elapsed_time

    attr_accessor :timer

    def initialize(attributes={})
      super attributes
      @created_at = DateTime.now
      @status = :unstarted
    end

    def start
      raise 'The timer is already started.' unless @status != :running
      @status = :running
      @started_at = DateTime.now
    end

    def stop
      raise 'The entry is not running.' unless @status != :stopped
      @status = :stopped
      @finished_at = DateTime.now
    end

    def to_s
      "#{@name} : #{@description} (#{elapsed_time_to_s})"
    end

    private

    # Return elapsed time between start and end
    def get_elapsed_time
      @elapsed_time = (@finished_at.to_time - @started_at.to_time).to_i
    end

    # Print elapsed time formated "d h:i:s"
    def elapsed_time_to_s
      secs = get_elapsed_time
      mins = secs / 60
      hours = mins / 60
      days = hours / 24

      string = "#{hours % 24}h:#{mins % 60}m:#{secs % 60}s"

      if days > 0
        string = "#{days}j " + string
      end

      string
    end
  end
end

Timemaniac::Entry.auto_upgrade!