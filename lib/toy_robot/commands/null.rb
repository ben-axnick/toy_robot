module ToyRobot
  module Commands
    class Null
      def initialize(*_)
      end

      def perform(_)
      end

      def output
      end

      def self.matches?
        true
      end
    end
  end
end
