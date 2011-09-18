require 'lib/command'
require 'singleton'

class CommandManager
    include Singleton

    def initialize
        @commands = {}
        register_command :list
    end

    def register_command(command_obj)
        @commands[command_obj] = false
    end

    def [](command_name)
        command_name = command_name.intern
        return nil unless @commands.key?(command_name)
        @commands[command_name] ||= load_and_instantiate(command_name)
    end

    private

    def load_and_instantiate(command_name)
        command_name = command_name.to_s
        retried = false

        begin
            const_name = command_name.capitalize.gsub(/_(.)/) { $1.upcase }
            Commands.const_get("#{const_name}Command").new
        rescue NameError
            if retried then
                raise
            else
                retried = true
                require "timemaniac/commands/#{command_name}_command"
                retry
            end
        end
    end
end
