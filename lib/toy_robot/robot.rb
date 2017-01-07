module ToyRobot
  class Robot
    attr_reader :table_placement

    def initialize(table_placement)
      @table_placement = table_placement
    end

    def place(table_placement)
      if table_placement.within_bounds?
        Robot.new(table_placement)
      else
        self
      end
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
        table_placement.position.x,
        table_placement.position.y,
        table_placement.orientation.to_s
      ]
    end
  end
end
