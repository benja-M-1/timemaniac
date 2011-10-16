describe Timemaniac::Model::Task do
    it "test Task name method" do
        task = Timemaniac::Model::Task.new "test"
        task.name.should == "test"
    end
end
