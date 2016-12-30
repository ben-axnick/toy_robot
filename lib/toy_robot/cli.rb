require 'toy_robot/unplaced_robot'
require 'toy_robot/command_interpreter'
require 'toy_robot/tokenizer'

module ToyRobot
  class CLI
    def initialize(robot: nil, command_interpreter: nil)
      @robot = UnplacedRobot.new
      @command_interpreter = command_interpreter || CommandInterpreter.new(Tokenizer.new)
    end

    def process_line(line)
      command = @command_interpreter.process(line)
      @robot = command.perform(@robot)

      command.output
    end
  end
end
