require "toy_robot/commands/simple"

module ToyRobot
  module Commands
    class Place
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

      def action(tokens)
        return unless tokens.cmd == "place"

        x = Integer(tokens.args[0]) rescue nil
        y = Integer(tokens.args[1]) rescue nil
        orientation = tokens.args[2]

        if x && y && orientation
          Action.new(x, y, orientation.to_sym)
        end
      end
    end
  end
end
