require 'test/unit/testsuite'
require File.join(File.dirname(__FILE__), 'timer_test')

class TimemaniacTests
    def self.suite
        suite = Test::Unit::TestSuite.new
        suite << TimerTestCase.suite

        return suite
    end
end
