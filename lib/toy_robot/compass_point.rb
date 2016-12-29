class ToyRobot::CompassPoint < Struct.new(:x, :y, :orientation)
  ORIENTATIONS = %i(north east south west)

  def move
    CompassPoint.new(@x + move_vector.x, @y + move_vector.y, @orientation)
  end

  def left
    CompassPoint.new(@x, @y, reorient(-1))
  end

  def right
    CompassPoint.new(@x, @y, reorient(1))
  end

  private

  def movement_vector
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
    ORIENTATIONS.rotate(ORIENTATIONS.index(@orientation) + increments).first
  end
end
