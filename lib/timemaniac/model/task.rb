module Timemaniac
    module Model
        class Task
            attr_accessor :name
            def initialize(name)
                @name = name
            end
        end
    end
end
