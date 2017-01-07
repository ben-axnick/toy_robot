module ToyRobot
  Vector = Struct.new(:x, :y) do
    def self.coerce(x, y)
      new(Integer(x), Integer(y))
    rescue ArgumentError, TypeError
      nil
    end

    def +(other)
      Vector.new(other.x + x, other.y + y)
    end
  end
end
