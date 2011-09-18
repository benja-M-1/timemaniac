module Timemaniac
    class Entry
    	# Name of the entry
        attr_accessor :name
        
        # Description of the entry
        attr_accessor :description
        
        # Timer 
        attr_reader :timer

        def initialize(name, description)
            @name = name
            @description = description
            @timer = Timemaniac::Timer.new
        end

        def start
            @timer.start
        end

        def stop
            @timer.stop
        end

        def to_s
            "#{@name} : #{@description}"
        end
    end
end
