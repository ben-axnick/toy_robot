require "toy_robot/commands"
require "toy_robot/tokenizer"

module ToyRobot
  class CommandInterpreter
    def initialize(tokenizer: nil, commands: nil, fallback: nil)
      @tokenizer = tokenizer || Tokenizer.new
      @commands = commands   || Commands::DEFAULT
      @fallback = fallback   || Commands::Null
    end

    def process(line)
      tokens = @tokenizer.tokenize(line)
      found = commands.detect { |command| command.matches?(tokens.cmd) }
      found.new(*tokens.args)
    end

    private

    def commands
      @commands | [@fallback]
    end
  end
end
