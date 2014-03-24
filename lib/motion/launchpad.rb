module Motion
  module Launchpad
    
    class << self
      attr_accessor :instance
    end

    def configure(*args, &block)
      self.instance = Schedule.new(*args) if instance.nil?
      instance.configure(&block) if block_given?
      instance
    end

    module_function :configure
  end
end
