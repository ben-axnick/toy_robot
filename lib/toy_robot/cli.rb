require 'toy_robot/unplaced_robot'
require 'toy_robot/command_interpreter'
require 'toy_robot/tokenizer'

module ToyRobot
  class CLI
    def initialize
      @robot = UnplacedRobot.new
      @command_interpreter = CommandInterpreter.new(Tokenizer.new)
    end

    def process_line(line)
      command = @command_interpreter.process(command)
      @robot = command.perform(@robot)
      puts command.output if command.output
    end
  end
end
