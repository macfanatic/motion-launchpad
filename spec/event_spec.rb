describe Motion::Launchpad::Event do

  def event(count, callback=nil)
    Motion::Launchpad::Event.new count, callback
  end

  describe '#every?' do
    it "returns false if not a symbol matching :every" do
      event(1).should.not.be.every
    end

    it "returns true if given :every" do
      event(:every).should.be.every
    end
  end

  describe '#applicable?' do
    it "returns always returns true if #every? is true" do
      event(:every).should.be.applicable(1)
      event(:every).should.be.applicable(5)
    end

    it "returns false if count does not match" do
      event(1).should.not.be.applicable(5)
    end

    it "returns true if count matches" do
      event(1).should.be.applicable(1)
    end
  end

  describe '#call' do
    it "executes the given block" do
      e = event :every, ->{ true }
      e.call.should.be.true
    end
  end

end
