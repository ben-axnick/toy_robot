require "toy_robot/commands"
require "toy_robot/tokenizer"

module ToyRobot
  class CommandInterpreter
    def initialize(tokenizer: nil, commands: nil)
      @tokenizer = tokenizer || Tokenizer.new
      @commands = commands || Commands::DEFAULT
    end

    def process(line)
      tokens = @tokenizer.tokenize(line)

      commands
        .lazy
        .map { |command| command.action(tokens) }
        .detect { |action| !action.nil? }
    end

    private

    def commands
      @commands | [Commands::Null]
    end
  end
end
