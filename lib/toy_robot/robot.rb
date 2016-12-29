class ToyRobot::Robot
  def initialize(table_placement)
    @table_placement = table_placement
  end

  def place(table_placement)
    Robot.new(table_placement)
  end

  def left
    Robot.new(@table_placement.left)
  end

  def right
    Robot.new(@table_placement.right)
  end

  def move
    next_table_placement = @table_placement.move

    if next_table_placement.within_bounds?
      Robot.new(next_table_placement)
    else
      self
    end
  end

  def report
    "%s, %s, %s" % [
      @table_placement.x,
      @table_placement.y,
      @table_placement.orientation.to_s.upcase
    ]
  end
end
