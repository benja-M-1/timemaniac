require 'simplecov'

SimpleCov.start do
    # Filtered files are ignored
    add_filter "/spec/"

    # Grouped files
    add_group "Executable", "bin"
    add_group "Model", "lib/timemaniac/model"
    add_group "Cli", "lib/timemaniac/command"
end

require "timemaniac"
