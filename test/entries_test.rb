require File.join(File.dirname(__FILE__), 'helper')

class EntriesTestCase < Test::Unit::TestCase

    def test_append_named
        entry = mock('entry') 
        entry.expects(:name).returns('Testing').at_least_once
        entry.expects(:respond_to?).with(:name).returns(true)

        entries = Timemaniac::Entries.new
        entries.append(entry)

        assert_equal(1, entries.length)
        assert_raise(ArgumentError, '1 does not exist.') { entries[0].name }
        assert_equal('Testing', entries['Testing'].name)
        assert_equal('Testing', entries.current.name)
    end

    def test_remove
        hsh_entries = { 'one' => stub(:entry => 'one'), 'two' => stub(:entry, 'two') }
        entries = Timemaniac::Entries.new
        entries.entries = hsh_entries

        assert_equal(2, entries.length)

        entries.remove(1)
        assert_equal(2, entries.length)

        entries.remove('one')
        assert_equal(1, entries.length)
    end
end
