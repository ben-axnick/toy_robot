require 'toy_robot/commands/null'
require 'toy_robot/commands/place'
require 'toy_robot/commands/simple'
require 'toy_robot/commands/wrapped'

module ToyRobot
  module Commands
    Result = Struct.new(:robot, :output)

    LEFT = Simple.new(:left, Proc.new { |robot| robot.left })
    RIGHT = Simple.new(:right, Proc.new { |robot| robot.right })
    MOVE = Simple.new(:move, Proc.new { |robot| robot.move })
    REPORT = Wrapped.new(:report, Proc.new { |robot| robot.report })

    DEFAULT = [
      Place.new,
      LEFT,
      RIGHT,
      MOVE,
      REPORT,
    ]
  end
end
