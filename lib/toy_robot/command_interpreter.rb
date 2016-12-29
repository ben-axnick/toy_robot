require 'toy_robot/commands'

module ToyRobot
  class CommandInterpreter < Struct.new(:tokenizer)
    def process(line)
      tokens = tokenizer.tokenize(line)

      Commands::DEFAULT
        .first { |command| command.matches?(tokens.cmd) }
        .new(*tokens.args)
    end
  end
end
