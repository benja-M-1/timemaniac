#!/usr/bin/env ruby

require 'test/unit'
require File.expand_path(File.dirname(__FILE__)+'/../src/TimeEntry') 
#require 'TimeManiac/TimeEntry'

class TimeEntryTestCase < Test::Unit::TestCase
    def test_initialize
        time_entry = TimeEntry.new('Testing', 'Testing message')

        assert_equal('Testing', time_entry.name)
        assert_equal('Testing message', time_entry.message)
    end

    def test_start_time_entry
        time_entry = TimeEntry.new('Testing', 'Testing message')
        time_entry.start_time_entry
        start = Time.now

        assert_equal(start.min, time_entry.start_time.min)
        assert_equal(start.sec, time_entry.start_time.sec)
    end

    def test_end_time_entry
        time_entry = TimeEntry.new('Testing', 'Testing message')
        time_entry.start_time_entry

        sleeping_sec = 2
        sleep(sleeping_sec)

        time_entry.end_time_entry
        assert_equal(sleeping_sec, time_entry.elapsed_time)
    end
end
