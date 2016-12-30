require 'toy_robot/commands/place'
require 'toy_robot/commands/report'
require 'toy_robot/commands/null'

module ToyRobot
  module Commands
    DEFAULT = [
      Place,
      Report
    ]
  end
end
