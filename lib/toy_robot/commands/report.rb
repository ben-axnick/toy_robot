require "toy_robot/commands/simple"

module ToyRobot
  module Commands
    class Report < ToyRobot::Commands::Simple.construct(:report)
      def perform(robot)
        robot.tap do
          @output = robot.report
        end
      end
    end
  end
end
