module ToyRobot
  module Commands
    class Left
      attr_reader :output

      def perform(robot)
        robot.left
      end

      def self.matches?(cmd)
        cmd == "left"
      end
    end
  end
end
