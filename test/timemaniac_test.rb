require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

require 'test/lib/timemaniac/timer_test'
require 'test/lib/timemaniac/entry_test'
require 'test/lib/timemaniac/entries_test'
require 'test/lib/command_runner_test'
require 'test/lib/command_manager_test'

class TimemaniacTests
    def self.suite
        suite = Test::Unit::TestSuite.new

        # Model
        suite << TimerTest.suite
        suite << EntryTest.suite
        suite << EntriesTest.suite

        # Commands
        suite << CommandRunnerTest.suite
        suite << CommandManagerTest.suite

        return suite
    end
end

Test::Unit::UI::Console::TestRunner.run(TimemaniacTests)
