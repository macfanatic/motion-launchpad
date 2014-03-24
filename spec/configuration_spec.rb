describe Motion::Launchpad do

  it "should return an instance" do
    Motion::Launchpad.configure.should.be.instance_of Motion::Launchpad::Schedule
  end

  it "should return the same instance twice" do
    instance = Motion::Launchpad.configure
    instance.should.be.equal Motion::Launchpad.configure
  end

  it "defaults the preferences key to :launch_count" do
    instance = Motion::Launchpad::Schedule.new
    instance.preferences_key.should.be.equal :launch_count
  end

  it "allows you to customize the preferences key" do
    instance = Motion::Launchpad::Schedule.new preferences_key: :my_counter
    instance.preferences_key.should.be.equal :my_counter
  end
end
