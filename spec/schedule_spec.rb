describe Motion::Launchpad::Schedule do

  describe '#configure' do
    it "runs the block" do
      instance = Motion::Launchpad::Schedule.new
      instance.configure { true }.should.be.true
    end
  end

end
