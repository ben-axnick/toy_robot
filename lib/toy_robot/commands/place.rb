module ToyRobot
  module Commands
    class Place
      def initialize(x, y, orientation)
        @x = x
        @y = y
        @orientation = orientation
      end

      def perform(robot)
        return robot unless valid?

        robot.place(
          TablePlacement.new(x, y, orientation)
        )
      end

      def valid?
        valid_x? && valid_y? && valid_orientation? &&
          TablePlacement.new(x, y, orientation).valid?
      end

      def output
      end

      def self.matches?(cmd)
        cmd == "place"
      end

      private

      def x
        @x.to_i
      end

      def valid_x?
        Integer(@x) rescue false
      end

      def y
        @y.to_i
      end

      def valid_y?
        Integer(@y) rescue false
      end

      def orientation
        @orientation && @orientation.downcase.to_sym
      end

      def valid_orientation?
        !@orientation.nil?
      end
    end
  end
end
