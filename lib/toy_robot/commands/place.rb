require 'toy_robot/commands/named'

module ToyRobot
  module Commands
    class Place < Struct.new(:x, :y, :orientation)
      include Named

      def perform(robot)
        return unless valid?

        robot.place(
          TablePlacement.new(@x, @y, @orientation)
        )
      end

      def valid?
        TablePlacement.valid_orientation?(orientation) &&
          TablePlacement.new(@x, @y, @orientation).within_bounds?
      end

      private

      def x
        @x.to_i
      end

      def y
        @y.to_i
      end

      def orientation
        @orientation.downcase.to_sym
      end
    end
  end
end
