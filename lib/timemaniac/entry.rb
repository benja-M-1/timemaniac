module Timemaniac
  class Entry
    include DataMapper::Resource

    property :id,          Serial
    property :name,        String
    property :description, Text
    property :status,      String
    property :created_at,  Time
    property :started_at,  Time
    property :finished_at, Time

    attr_accessor :timer

    def initialize(attributes={ })
      super attributes
      @created_at = Time.now
      @status     = :unstarted.to_s
    end

    # Starts the entry
    # @return Timemaniac::Entry
    def start
      raise 'The entry is already started.' unless @status != :running
      @status      = :running.to_s
      @started_at  = Time.now
      @finished_at = Time.now
    end

    # Stops the entry
    # @return Timemaniac::Entry
    def stop
      raise 'The entry is not running.' unless @status != :stopped
      @status      = :stopped.to_s
      @finished_at = Time.now
    end

    # Return the formated entry to output
    # @return String
    def to_s
      "#{@name} : #{@description} (#{elapsed_time_to_s})"
    end

    # Return elapsed time between start and end
    # @return Integer
    def elapsed_time
      (@finished_at - @started_at).to_i
    end

    # Print elapsed time formated "d h:i:s"
    # @return String
    def elapsed_time_to_s
      secs  = elapsed_time
      mins  = secs / 60
      hours = mins / 60
      days  = hours / 24

      string = "#{hours % 24}h:#{mins % 60}m:#{secs % 60}s"

      if days > 0
        string = "#{days}j " + string
      end

      string
    end
  end
end