describe Motion::Launchpad do

  it "should return an instance" do
    Motion::Launchpad.configure.should.be.instance_of Motion::Launchpad::Schedule
  end

  it "should return the same instance twice" do
    instance = Motion::Launchpad.configure
    instance.should.be.equal Motion::Launchpad.configure
  end

  it "delegates #run! to an instance" do
    @runner = nil

    Motion::Launchpad.configure do |config|
      config.on(:every) { @runner = true }
    end

    Motion::Launchpad.run!
    @runner.should.be.true
  end
end
