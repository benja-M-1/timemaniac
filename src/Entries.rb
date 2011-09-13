#!/usr/bin/env ruby

module Timemaniac

    class Entries
        attr_accessor :entries,
                      :current

        def initialize
            @entries = {}
            @current = nil
        end

        def add_entry(entry)
            @entries.store(entry.respond_to?(:name) ? entry.name : length, entry)

            if @current.nil?
                @current = entry
            end
        end

        def remove_entry(key)
            if key.kind_of?(Integer)
                @entries.delete(key) {|key| "Entry #{key} does not exists."}
            else
                raise ArgumentError.new("#{key} must be an integer")
            end
        end

        def purge
            @entries.clear
        end

        def length
            return @entries.length
        end

        def [](key)
            if key.kind_of?(Integer)
                return @entries[key]
            else
                raise ArgumentError.new("#{key} must be an integer")
            end
        end
    end

end
