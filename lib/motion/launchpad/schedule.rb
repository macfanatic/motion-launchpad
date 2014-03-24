module Motion
  module Launchpad
    class Schedule
      attr_accessor :preferences_key

      def initialize(options={}, &block)
        self.preferences_key = options.fetch(:preferences_key, :launch_count)
        @events = []

        handle_launch
      end

      def configure
        yield(self) if block_given?
      end

      private

      def handle_launch
        if NSUserDefaults.standardUserDefaults[preferences_key].nil?
          NSUserDefaults.standardUserDefaults[preferences_key] = 1
        else
          NSUserDefaults.standardUserDefaults[preferences_key] = NSUserDefaults.standardUserDefaults[preferences_key] + 1
        end
      end
    end
  end
end
