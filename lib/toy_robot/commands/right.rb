module ToyRobot
  module Commands
    class Right
      attr_reader :output

      def perform(robot)
        robot.right
      end

      def self.matches?(cmd)
        cmd == "right"
      end
    end
  end
end
