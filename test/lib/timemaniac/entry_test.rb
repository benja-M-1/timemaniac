require 'test/helper'

class EntryTest < Test::Unit::TestCase
  def test_initialize
    entry = Timemaniac::Entry.new({ :name => 'Name', :description => 'Description' })
    assert_equal 'Name', entry.name, 'entry.name is Name'
    assert_equal 'Description', entry.description, 'entry.description is Description'
    assert_equal "unstarted", entry.status, 'entry is not started yet'
  end

  def test_start
    entry = Timemaniac::Entry.new({ :name => 'Name', :description => 'Description' })
    entry.start

    assert_equal "running", entry.status, 'entry.timer is running'
  end

  def test_stop
    entry = Timemaniac::Entry.new({ :name => 'Name', :description => 'Description' })
    entry.start
    entry.stop

    assert_equal "stopped", entry.status, 'entry.timer is stopped'
  end

  def test_elapsed_time
    entry = Timemaniac::Entry.new({ :name => 'Name', :description => 'Description' })
    entry.start

    assert_equal "0h:0m:0s", entry.elapsed_time_to_s, 'entry.elapsed_time_to_s is ok'

    entry.finished_at = Time.now + 3600

    assert_equal "1h:0m:0s", entry.elapsed_time_to_s, 'entry.elapsed_time_to_s is ok'

    entry.finished_at = Time.now + 179110
    assert_equal '2j 1h:45m:10s', entry.elapsed_time_to_s, 'entry.elapsed_time_to_s is ok'

    entry.finished_at = Time.now + 60
    assert_equal '0h:1m:0s', entry.elapsed_time_to_s, 'entry.elapsed_time_to_s is ok'

    entry.finished_at = Time.now + 1
    assert_equal '0h:0m:1s', entry.elapsed_time_to_s, 'entry.elapsed_time_to_s is ok'
  end
end
