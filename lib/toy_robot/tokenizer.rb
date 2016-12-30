module ToyRobot
  class Tokenizer
    TokenizedLine = Struct.new(:cmd, :args)

    def tokenize(line)
      tokens = whitespace_tokens(line)

      TokenizedLine.new(
        cmd(tokens),
        args(tokens)
      )
    end

    private

    def whitespace_tokens(line)
      line.strip.downcase.split(' ')
    end

    def cmd(tokens)
      tokens.first
    end

    def args(tokens)
      args = tokens[1..-1] || []
      args.join(' ').split(',').map(&:strip)
    end
  end
end
