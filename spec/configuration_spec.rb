describe Motion::Launchpad do

  it "should return an instance" do
    Motion::Launchpad.configure.should.be.instance_of Motion::Launchpad
  end

  it "should return the same instance twice" do
    instance = Motion::Launchpad.configure
    instance.should.be.equal Motion::Launchpad.configure
  end
end
