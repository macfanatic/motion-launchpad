module Motion
  class Launchpad

    class << self
      attr_accessor :instance

      def configure(&block)
        self.instance = new if instance.nil?
        instance
      end
    end

  end
end
