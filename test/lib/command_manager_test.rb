require "test/helper"

class CommandManagerTest < Test::Unit::TestCase
  def setup
    @manager_class = CommandManager
  end

  def test_instance
    manager = @manager_class.clone.instance

    assert manager.instance_variable_defined?('@commands')
    assert_equal false, manager.instance_variable_get('@commands').empty?
  end

  def test_register_command
    manager = @manager_class.clone.instance

    assert_raise(ArgumentError) { manager.register_command }
    assert_equal false, manager.register_command(:toto)
    assert manager.instance_variable_get('@commands').keys.member?(:toto)
  end

  # test [] method
  def test_array_finder
    manager = @manager_class.clone.instance

    assert_kind_of Commands::ListCommand, manager['list']
  end

  # test mocking load_and_instanciate
  def test_array_finder_mocked
    manager = @manager_class.clone.instance
    manager.expects(:load_and_instantiate).with(:list).returns(true).once

    assert manager['list']
    assert_equal nil, manager['pouet']
    assert_raise(ArgumentError) { manager[] }
  end
end