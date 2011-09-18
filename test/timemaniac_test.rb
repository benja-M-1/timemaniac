require 'test/unit/testsuite'
require File.join(File.dirname(__FILE__), 'timer_test')
require File.join(File.dirname(__FILE__), 'entry_test')
require File.join(File.dirname(__FILE__), 'entries_test')

class TimemaniacTests
    def self.suite
        suite = Test::Unit::TestSuite.new
        suite << TimerTestCase.suite
        suite << EntryTestCase.suite
        suite << EntriesTestCase.suite

        return suite
    end
end
