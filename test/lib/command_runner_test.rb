require "test/helper"

class CommandRunnerTest < Test::Unit::TestCase
  def test_initialize
    command = CommandRunner.new
    assert_equal(CommandManager, command.command_manager_class)
  end

  def test_run_error
    command_runner = CommandRunner.new
    assert_raise(ArgumentError) { command_runner.run() }
  end

  def test_run
    # Mock command
    command = mock('command')
    command.expects(:execute).with(['arg1', 'arg2']).returns(true).once
    # Mock CommandManager
    manager = mock('manager')
    manager.expects(:[]).with('test').returns(command).at_least_once
    # Stub CommandManager instance method
    CommandManager.stubs(:instance).returns(manager).once

    runner = CommandRunner.new
    args   = ['test', 'arg1', 'arg2']

    assert_equal(true, runner.run(args))
  end
end