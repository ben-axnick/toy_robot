module ToyRobot
  module Commands
    class Null
      def initialize(*_)
      end

      def perform(robot)
        Result.new(robot)
      end

      def output
      end

      def self.matches?(_)
        true
      end
    end
  end
end
