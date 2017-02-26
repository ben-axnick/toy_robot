# Construct a command from a proc. The purpose of the wrapping is
# to return the caller's robot back to them unaltered.

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
