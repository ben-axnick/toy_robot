module ToyRobot
  module Commands
    class Place < Struct.new(:x, :y, :orientation)
      def perform(robot)
        return unless valid?

        robot.place(
          TablePlacement.new(@x, @y, @orientation)
        )
      end

      def valid?
        TablePlacement.new(@x, @y, @orientation).valid?
      end

      def self.matches?(cmd)
        cmd == "place"
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
