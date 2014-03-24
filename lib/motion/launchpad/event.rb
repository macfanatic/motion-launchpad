module Motion
  module Launchpad
    class Event
      attr_reader :count, :callback

      def initialize(count, callback)
        @count, @callback = count, callback
      end

      def call
        callback.call
      end

      def applicable?(launch)
        every? || launch == count
      end

      def every?
        count == :every
      end
    end
  end
end
