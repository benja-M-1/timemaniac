module Timemaniac

    class Timer

        # Statuses
        @@unstarted = 0
        @@running   = 1
        @@paused    = 2
        @@stopped   = 3 

        # The date on which starts the timer
        attr_accessor :start_date
        
        # The date on which ends the timer
        attr_accessor :end_date

        # The status of the timer
        attr_accessor :status

        # The elapsed time between the 
        # start and the and of the timer
        attr_accessor :elapsed_time

        def initialize
            @start_date = Time.now
            @end_date   = Time.now
            @status     = @@unstarted
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
        end

        # Print elapsed time formated "d h:i:s"
        def to_s
            secs  = get_elapsed_time
            mins  = secs / 60
            hours = mins / 60
            days  = hours / 24
            

            string = "#{hours % 24}h:#{mins % 60}m:#{secs % 60}s"

            if days > 0
                string = "#{days}j " + string
            end

            return string
        end
    end

end
