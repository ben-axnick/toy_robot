require 'toy_robot/commands/left'
require 'toy_robot/commands/move'
require 'toy_robot/commands/null'
require 'toy_robot/commands/place'
require 'toy_robot/commands/report'
require 'toy_robot/commands/right'

module ToyRobot
  module Commands
    DEFAULT = [
      Left,
      Move,
      Place,
      Report,
      Right,
    ]
  end
end
