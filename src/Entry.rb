#!/usr/bin/env ruby

module Timemaniac

    class Entry
        attr_accessor :name,
                      :description,
                      :timer,
                      :started_at,
                      :finished_at,
                      :elapsed_time

        def initialize(name, description)
            @name = name
            @description = description
            @started_at = DateTime.now
            @elapsed_time = 0
        end
    end

end
