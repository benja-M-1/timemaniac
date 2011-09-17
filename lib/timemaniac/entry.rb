module Timemaniac
    class Entry
    	# Name of the entry
        attr_accessor :name
        
        # Description of the entry
        attr_accessor :description
        
        # Timer 
        attr_accessor :timer

        def initialize(name, description)
            @name = name
            @description = description
            @timer = Timer.new
        end
    end
end
