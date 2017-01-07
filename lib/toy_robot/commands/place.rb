require "toy_robot/commands/simple"

module ToyRobot
  module Commands
    class Place
      def action(tokens)
        TokenCoercer.new(tokens).to_action if tokens.cmd == "place"
      end

      class Action
        def initialize(x, y, orientation)
          @x = x
          @y = y
          @orientation = orientation
        end

        def perform(robot)
          desired_placement = TablePlacement.new(@x, @y, @orientation)

          if desired_placement.valid?
            Result.new(robot.place(desired_placement))
          else
            Result.new(robot)
          end
        end
      end

      class TokenCoercer < SimpleDelegator
        def to_action
          if x && y && orientation
            Action.new(x, y, orientation)
          end
        end

        private

        def x
          Integer(args[0]) rescue nil
        end

        def y
          Integer(args[1]) rescue nil
        end

        def orientation
          args[2] && args[2].to_sym
        end
      end
    end
  end
end
