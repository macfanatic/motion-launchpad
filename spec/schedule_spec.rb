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

  it "defaults the preferences key to :launch_count" do
    instance = Motion::Launchpad::Schedule.new
    instance.preferences_key.should.be.equal :launch_count
  end

  it "allows you to customize the preferences key" do
    instance = Motion::Launchpad::Schedule.new preferences_key: :my_counter
    instance.preferences_key.should.be.equal :my_counter
  end

  it "initializes NSUserDefaults store on #new" do
    instance = Motion::Launchpad::Schedule.new
    NSUserDefaults.standardUserDefaults[:launch_count].should.be.equal 1
  end

  it "adds a new event when call #on inside the configure block" do
    instance = Motion::Launchpad::Schedule.new
    instance.configure do |config|
      config.on(:every) { true }
    end

    instance.events.should.not.be.empty
    e = instance.events.first
    e.count.should.be.equal :every
  end

  it "calling #configure multiple times continues to add events" do
    instance = Motion::Launchpad::Schedule.new
    instance.configure do |config|
      config.on(:every) { true }
    end

    instance.configure do |config|
      config.on(1) { true }
    end

    instance.events.count.should.be.equal 2
  end

  it "executes the events when calling #run!" do
    instance = Motion::Launchpad::Schedule.new
    instance.configure do |config|
      config.on(:every) { NSUserDefaults.standardUserDefaults[:my_testing_key] = "test" }
    end

    NSUserDefaults.standardUserDefaults[:my_testing_key].should.be.nil

    instance.run!

    NSUserDefaults.standardUserDefaults[:my_testing_key].should.be.equal "test"
  end
end
