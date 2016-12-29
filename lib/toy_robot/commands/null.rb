class ToyRobot::Commands::Null
  def initialize(*_)
  end

  def self.matches?
    true
  end
end
