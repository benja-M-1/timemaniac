describe Timemaniac::Command do
    it 'test initialize method with error' do
        expect { Timemaniac::Command.new }.to raise_error(ArgumentError)
    end

    it 'test initialize method with one parameter' do
        command = Timemaniac::Command.new 'test'

        command.name.should =~ /test/
            command.summary.should be_nil
        command.defaults.empty?.should be_true
        command.program_name.should =~ /timemaniac test/
    end

    it 'test initialize method with two parameters' do
        command = Timemaniac::Command.new 'test', 'This is a test command.'

        command.name.should =~ /test/
            command.summary.should =~ /This is a test command/
            command.defaults.empty?.should be_true
        command.program_name.should =~ /timemaniac test/
    end

    it 'test initialize method with all parameters' do
        command = Timemaniac::Command.new 'test', 'This is a test command.', { 'first' => 'option one' }

        command.name.should =~ /test/
            command.summary.should =~ /This is a test command/
            command.defaults.keys.first.should =~ /first/
            command.defaults.values.first.should =~ /option one/
            command.program_name.should =~ /timemaniac test/
    end

    it 'test execute method' do
        command = Timemaniac::Command.new 'test', 'This is a test command.', { 'first' => 'option one' }
        expect { command.execute }.to raise_error(RuntimeError)
    end
end
