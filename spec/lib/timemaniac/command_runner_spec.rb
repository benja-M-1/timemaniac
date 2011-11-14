require "timemaniac/command_runner"

describe Timemaniac::CommandRunner do
    it "test initialize method" do
        runner = Timemaniac::CommandRunner.new
        runner.command_manager_class.should equal Timemaniac::CommandManager
    end

    it "test run method and throw an error" do
        runner = Timemaniac::CommandRunner.new
        expect { runner.run }.to raise_error(ArgumentError)
    end

    it "test run method" do
        # Mock command
        command = mock('command')
        command.expects('run').with(['arg1', 'arg2']).returns(true).once
        # Mock CommandManager
        manager = mock('manager')
        manager.expects('[]').with('test').returns(command).at_least_once
        # Stub CommandManager instance method
        Timemaniac::CommandManager.stubs('instance').returns(manager).once

        runner = Timemaniac::CommandRunner.new
        args   = ['test', 'arg1', 'arg2']

        runner.run(args).should be_true
    end
end
