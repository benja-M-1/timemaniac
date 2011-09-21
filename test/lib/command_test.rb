require "test/helper"

class CommandTest < Test::Unit::TestCase
  def test_initialize_error
    assert_raise(ArgumentError) { Command.new }
  end

  def test_initialize_one_param
    command = Command.new('test')

    assert_equal('test', command.name)
    assert_equal(nil, command.summary)
    assert_equal({}, command.defaults)
    assert_equal('timemaniac test', command.program_name)
  end

  def test_initialize_two_param
    command = Command.new('test', 'This is a test command.')

    assert_equal('test', command.name)
    assert_equal('This is a test command.', command.summary)
    assert_equal({}, command.defaults)
    assert_equal('timemaniac test', command.program_name)
  end

  def test_initialize_all_params
    command = Command.new('test', 'This is a test command.', { 'first' => 'option one' })

    assert_equal('test', command.name)
    assert_equal('This is a test command.', command.summary)
    assert_equal('first', command.defaults.keys.first)
    assert_equal('option one', command.defaults.values.first)
    assert_equal('timemaniac test', command.program_name)
  end

  def test_execute
    command = Command.new('test', 'This is a test command.', { 'first' => 'option one' })
    assert_raise(RuntimeError) { command.execute }
  end
end