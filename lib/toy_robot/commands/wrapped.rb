require "toy_robot/commands/simple"

module ToyRobot
  module Commands
    class Wrapped < Simple
      private

      def action_klass
        Struct.new(:action) do
          def perform(robot)
            Result.new(robot, action.call(robot))
          end
        end
      end
    end
  end
end
