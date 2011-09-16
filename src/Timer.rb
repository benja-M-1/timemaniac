#!/usr/bin/env ruby

module Timemaniac

    class Timer
        # The date on which starts the timer
        attr_accessor :start_date

        # The date on which ends the timer
        attr_accessor :end_date
        
        # The status of the timer
        attr_accessor :status

        # The elapsed time between the 
        # start and the and of the timer
        attr_accessor :elapsed_time

        # Statuses
        @@unstarted = 0
        @@running   = 1
        @@paused    = 2
        @@stopped   = 3 

        # Initializes the timer
        def initialize
            @start_date = Time.now
            @end_date   = Time.now
            @status = @@unstarted
        end

        # Starts the timer
        def start
            if @status != @@running
                @status = @@running
            end
        end
        
        # Pauses the timer
        def pause
            if @status == @@running
                @status = @@paused
                @end_date = Time.now
            end
        end

        # Stops the timer
        def stop
            if @status != @@stopped
                @status = @@stopped
                @end_date = Time.now
            end
        end

        # Return elapsed time between start and end
        def get_elapsed_time
            @elapsed_time = (@end_date - @start_date).to_i
            @elapsed_time
        end

        # Print elapsed time formated "d h:i:s"
        def to_s
            secs  = get_elapsed_time
            mins  = secs / 60
            hours = mins / 60
            days  = hours / 24
            

            string = sprintf "%ih:%im:%is" % [hours % 24, mins % 60, secs % 60]

            if days > 0
                string = sprintf "%ij " % days + string
            end

            return string
        end
    end

end
