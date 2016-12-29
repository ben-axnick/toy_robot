class ToyRobot::Movements::Null
  attr_reader :location

  def move
    self.class.new
  end

  def left
    self.class.new
  end
  
  def right
    self.class.new
  end
end
