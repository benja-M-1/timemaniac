require 'Timemaniac'

require File.dirname(__FILE__)+'/../src/Entry'

class EntryTestCase < Timemaniac::TestCase

    def test_add_entry
        entry = mock('entry') 
        entry.expects(:name).returns('Testing')

        entries = Timemaniac::Entries.new
        entries.add_entry(entry)

        assert_equal(1, entries.length)
        assert_equal('Testing', entries.entries[0].name)
    end

    def test_remove_entry
        hsh_entries = { 'one' => stubs(:entry => 'one'), 'two' => stubs(:entry, 'two') }
        entries = Timemaniac::Entries.new
        entries.subs(:entries).return(hsh_entries)

        assert_equal(2, entries.length)

        entries.remove_entry(1)
        assert_equal(1, entries.length)
    end
end
