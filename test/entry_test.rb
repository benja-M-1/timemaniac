require File.join(File.dirname(__FILE__), 'helper')

class EntryTestCase < Test::Unit::TestCase
    def test_initialize
        entry = Timemaniac::Entry.new('Name', 'Description')
        assert_equal('Name', entry.name, 'entry.name is Name')
        assert_equal('Description', entry.description, 'entry.description is Description')
        assert_instance_of(Timemaniac::Timer, entry.timer, 'entry.timer is Timemaniac::Timer')
        assert_equal(Timemaniac::Timer.class_eval("@@unstarted"), entry.timer.status, 'entry.timer is not started yet')
    end

    def test_initialize_raise_exception
        assert_raise(ArgumentError) { Timemaniac::Entry.new }
    end

    def test_start
        entry = Timemaniac::Entry.new('Name', 'Description')
        entry.start

        assert_equal(Timemaniac::Timer.class_eval("@@running"), entry.timer.status, 'entry.timer is running')
    end

    def test_stop
        entry = Timemaniac::Entry.new('Name', 'Description')
        entry.start
        entry.stop

        assert_equal(Timemaniac::Timer.class_eval("@@stopped"), entry.timer.status, 'entry.timer is stopped')
    end
end
