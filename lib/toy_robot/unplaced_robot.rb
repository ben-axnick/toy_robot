require "toy_robot/robot"

module ToyRobot
  class UnplacedRobot
    def place(table_placement)
      if table_placement.within_bounds? 
        Robot.new(table_placement)
      else
        self
      end
    end

    def left
      raise NotImplementedError
    end

    def right
      raise NotImplementedError
    end

    def move
      raise NotImplementedError
    end

    def report
    end
  end
end
