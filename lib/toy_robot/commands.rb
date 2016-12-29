require 'toy_robot/commands/place'
require 'toy_robot/commands/null'

module ToyRobot
  module Commands
    DEFAULT = [
      Place,
      Null
    ]
  end
end
