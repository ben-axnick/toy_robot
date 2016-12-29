class ToyRobot::Table < Struct.new(:width, :height)
  def can_place?(x,y)
    (0..width-1).include?(x) && (0..height-1).include?(y)
  end
end
