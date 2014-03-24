module Motion
  module Launchpad
    
    class << self
      attr_accessor :instance
    end

    def configure(&block)
      self.instance = Schedule.new if instance.nil?
      instance
    end

    module_function :configure
  end
end
