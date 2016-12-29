class ToyRobot::Robot
  def initialize(surface = nil)
    @surface = Movements::Null.new
  end

  def place(surface)
    Robot.new(surface)
  end

  def left
    Robot.new(@surface.left)
  end

  def right
    Robot.new(@surface.right)
  end

  def move
    Robot.new(@surface.move)
  end

  def report
    "%s, %s, %s" % [
      @surface.location.x,
      @surface.location.y,
      @surface.location.orientation.to_s.upcase
    ]
  end
end
