require "test/helper"

class ListCommandTest < Test::Unit::TestCase
  def setup
    @command = Commands::ListCommand.new
  end
  def test_initialize
    assert_equal('list', @command.name)
    assert_equal('List tasks : lists the user\'s tasks.', @command.summary)
    assert_equal('timemaniac list', @command.program_name)
  end

  def test_get_entries
    entries = @command.get_entries

    assert_kind_of(Timemaniac::Entries, entries)
    assert_equal(2, entries.length)
  end
end