require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

require 'test/lib/timemaniac/entry_test'
require 'test/lib/command_runner_test'
require 'test/lib/command_manager_test'
require 'test/lib/command_test'

class TimemaniacTests
    def self.suite
        suite = Test::Unit::TestSuite.new

        # Model
        suite << EntryTest.suite

        # Commands
        suite << CommandRunnerTest.suite
        suite << CommandManagerTest.suite
        suite << CommandTest.suite

        return suite
    end
end

Test::Unit::UI::Console::TestRunner.run(TimemaniacTests)
