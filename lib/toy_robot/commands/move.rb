module ToyRobot
  module Commands
    class Move
      attr_reader :output

      def perform(robot)
        robot.move
      end

      def self.matches?(cmd)
        cmd == "move"
      end
    end
  end
end
