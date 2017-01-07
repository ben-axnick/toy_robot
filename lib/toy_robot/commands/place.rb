require "toy_robot/commands/simple"

module ToyRobot
  module Commands
    class Place
      class Action
        def initialize(placement)
          @placement = placement
        end

        def perform(robot)
          Result.new(robot.place(@placement))
        end
      end

      class TokenActioner < SimpleDelegator
        def action
          placement = TablePlacement.place(args[0], args[1], args[2])
          Action.new(placement) if placement
        end
      end

      def action(tokens)
        TokenActioner.new(tokens).action if tokens.cmd == "place"
      end
    end
  end
end
