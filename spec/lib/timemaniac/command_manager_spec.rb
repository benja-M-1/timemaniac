describe Timemaniac::CommandManager do
    before(:each) do 
        @manager_class = Timemaniac::CommandManager
    end

    it "test instance method" do
        manager = @manager_class.clone.instance

        manager.instance_variable_defined?('@commands').should be_true
        manager.instance_variable_get('@commands').empty?.should be_false
    end

    it "test register-command method" do
        manager = @manager_class.clone.instance

        expect { manager.register_command }.to raise_error(ArgumentError)
        manager.register_command(:toto).should be_false
        manager.instance_variable_get('@commands').keys.member?(:toto).should be_true
    end

    # test [] method
    it "test array finder" do
        manager = @manager_class.clone.instance

        manager['list'].should be_kind_of(Timemaniac::Commands::ListCommand)
    end

    # test mocking load_and_instanciate
    it "test array finder mocked" do
        manager = @manager_class.clone.instance
        manager.expects(:load_and_instantiate).with(:list).returns(true).once

        manager['list'].should be_true
        manager['pouet'].should be_nil
        expect { manager[] }.to raise_error(ArgumentError)
    end
end
