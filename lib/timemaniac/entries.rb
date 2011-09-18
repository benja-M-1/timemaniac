module Timemaniac

    class Entries
        # List of entries
        attr_accessor :entries

        # Current entry
        attr_reader   :current

        def initialize
            @entries = {}
            @current = nil
        end

        def append(entry)
            @entries.store(entry.respond_to?(:name) ? entry.name : length, entry)

            if @current.nil?
                @current = entry
            end
        end

        def remove(key)
            @entries.delete(key) {|key| "Entry #{key} does not exists."}
        end

        def purge
            @entries.clear
        end

        def length
            return @entries.length
        end

        def [](key)
            if @entries.key?(key)
                return @entries[key]
            else
                raise ArgumentError.new("#{key} does not exist.")
            end
        end
    end

end
