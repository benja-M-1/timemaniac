describe Timemaniac::Model::Task do
    it "test Task's name method" do
        task = Timemaniac::Model::Task.new('test')
        task.name.should =~ /test/
    end

    it "test Task's description method" do
        task = Timemaniac::Model::Task.new('test')
        task.description = "Lorem ipsum dolor blablabla..."
        task.description.should =~ /Lorem ipsum dolor blablabla.../
    end

    it "test Task's start method" do
        task = Timemaniac::Model::Task.new('test', 'description')
        task.status.should == :unstarted
        task.started_at.should be_nil

        task.start
        task.status.should == :running
        task.started_at.should be_an_instance_of Time
    end

    it "test Task's pause method" do
        task = Timemaniac::Model::Task.new('test', 'description')
        task.start
        task.pause
        task.status.should == :paused
        task.finished_at.should be_an_instance_of Time
    end

    it "test Task's stop method" do
        task = Timemaniac::Model::Task.new('test', 'description')
        task.start
        task.stop
        task.status.should == :stopped
        task.finished_at.should be_an_instance_of Time
    end
end
