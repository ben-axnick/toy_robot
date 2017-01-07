module ToyRobot
  class TablePlacement
    X_BOUNDS = (0..4)
    Y_BOUNDS = (0..4)

    attr_reader :position, :orientation

    def initialize(position, orientation)
      @position = position
      @orientation = orientation
    end

    def self.place(x, y, orientation)
      position = Vector.coerce(x, y)
      orientation = Orientation.coerce(orientation)

      TablePlacement.new(position, orientation) if position && orientation
    end

    def move
      TablePlacement.new(position + orientation.vector, orientation)
    end

    def left
      TablePlacement.new(position, orientation.rotate(1))
    end

    def right
      TablePlacement.new(position, orientation.rotate(-1))
    end

    def within_bounds?
      X_BOUNDS.include?(position.x) && Y_BOUNDS.include?(position.y)
    end

    def ==(other)
      false unless other.respond_to?(:position) && other.respond_to?(:orientation)
      
      other.orientation == orientation && other.position == position
    end
  end
end
