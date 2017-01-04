require 'toy_robot/commands/null'
require 'toy_robot/commands/place'
require 'toy_robot/commands/report'
require 'toy_robot/commands/simple'

module ToyRobot
  module Commands
    Result = Struct.new(:robot, :output)

    DEFAULT = [
      Place,
      Report,
      Simple.construct(:left),
      Simple.construct(:right),
      Simple.construct(:move),
    ]
  end
end
