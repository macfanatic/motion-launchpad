module Motion
  module Launchpad
    class Schedule
      attr_accessor :preferences_key

      def initialize(options={}, &block)
        self.preferences_key = options.fetch(:preferences_key, :launch_count)
        @events = []
      end

      def configure
        yield(self) if block_given?
      end
    end
  end
end
