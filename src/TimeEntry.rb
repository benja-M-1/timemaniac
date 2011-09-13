#!/usr/bin/env ruby

require 'date'

class TimeEntry
    attr_accessor :name,
        :message,
        :start_time,
        :elapsed_time

    def initialize(name = 'Action', message = '')
        @name =  name
        @message = message
        @elapsed_time = 0;
    end

    # Start the TimeEntry
    def start_time_entry
        @start_time = Time.now
    end

    # End the TimeEntry and calculate the elapsed time.
    def end_time_entry
        start  = @start_time.to_i
        finish = Time.now.to_i
        @elapsed_time += finish - start
    end

    # Restart the time entry
    def restart_time_entry
        start_time_entry
    end
end
