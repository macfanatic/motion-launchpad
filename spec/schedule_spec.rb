describe Motion::Launchpad::Schedule do

  before do
    NSUserDefaults.standardUserDefaults[:launch_count] = nil
  end

  describe '#configure' do
    it "runs the block" do
      instance = Motion::Launchpad::Schedule.new
      instance.configure { true }.should.be.true
    end
  end

  it "initializes NSUserDefaults store on #new" do
    instance = Motion::Launchpad::Schedule.new
    NSUserDefaults.standardUserDefaults[:launch_count].should.be.equal 1
  end

end
