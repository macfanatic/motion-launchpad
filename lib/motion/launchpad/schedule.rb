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

      def on(count, &block)
        @events << Event.new(count, block)
      end

      def run!
        events.each { |e| e.call }
      end

      def events
        @events.select { |e| e.applicable?(launch_count) }
      end

      private

      def launch_count
        NSUserDefaults.standardUserDefaults[preferences_key]
      end

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
