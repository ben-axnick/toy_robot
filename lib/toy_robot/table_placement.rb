module ToyRobot
  class TablePlacement < Struct.new(:x, :y, :orientation)
    ORIENTATIONS = %i(north east south west)

    X_BOUNDS = (0..4)
    Y_BOUNDS = (0..4)

    def move
      TablePlacement.new(x + move_vector.x, y + move_vector.y, orientation)
    end

    def left
      TablePlacement.new(x, y, reorient(-1))
    end

    def right
      TablePlacement.new(x, y, reorient(1))
    end

    def within_bounds?
      X_BOUNDS.include?(x) && Y_BOUNDS.include?(y)
    end

    def valid_orientation?
      ORIENTATIONS.include?(orientation)
    end

    def valid?
      within_bounds? && valid_orientation?
    end

    private

    Vector = Struct.new(:x, :y)

    def move_vector
      case orientation
      when :north
        Vector.new(0, -1)
      when :east
        Vector.new(1, 0)
      when :south
        Vector.new(0, 1)
      when :west
        Vector.new(-1, 0)
      end
    end

    def reorient(increments)
      ORIENTATIONS.rotate(ORIENTATIONS.index(orientation) + increments).first
    end
  end
end
