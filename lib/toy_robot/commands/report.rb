module ToyRobot
  module Commands
    class Report
      attr_reader :output

      def initialize(*_)
      end

      def perform(robot)
        robot.tap do
          @output = robot.report
        end
      end

      def self.matches?(cmd)
        cmd == "report"
      end
    end
  end
end
