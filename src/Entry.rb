#!/usr/bin/env ruby

module Timemaniac

    class Entry
        attr_accessor :name,
                      :description,
                      :timer

        def initialize(name, description)
            @name = name
            @description = description
            @timer = Timer.new
        end
    end

end
