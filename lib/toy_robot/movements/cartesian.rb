class ToyRobot::Movements::Cartesian < Struct.new(:table, :location)
  attr_reader :location

  def move
    next_location = location.move

    if @table.can_place?(next_location.x, next_location.y)
      Cartesian.new(@table, next_location)
    else
      self
    end
  end

  def left
    Cartesian.new(@table, location.left)
  end

  def right
    Cartesian.new(@table, location.right)
  end
end
