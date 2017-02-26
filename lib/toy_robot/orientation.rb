require 'toy_robot/vector'

module ToyRobot
  class Orientation
    def self.to_a
      [
        new(:east, Vector.new(1, 0)),
        new(:north, Vector.new(0, 1)),
        new(:west, Vector.new(-1, 0)),
        new(:south, Vector.new(0, -1))
      ]
    end

    def self.coerce(str)
      return if str.nil?

      to_a.detect { |orientation| orientation.label == str.downcase.to_sym }
    end
    
    attr_reader :label, :vector

    def initialize(label, vector)
      @label = label
      @vector = vector
    end

    def rotate(increments)
      self.class.to_a.rotate(self.class.to_a.index(self) + increments).first
    end

    def ==(other)
      other.label == label && other.vector == vector
    end

    def to_s
      label.to_s.upcase
    end
  end
end
