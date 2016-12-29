module ToyRobot
  class Tokenizer
    TokenizedLine = Struct.new(:cmd, :args)

    def tokenize(line)
      TokenizedLine.new(
        whitespace_tokens(line).first,
        whitespace_tokens(line)[1..-1].split(',').map(&:strip)
      )
    end

    private

    def whitespace_tokens(line)
      line.strip.downcase.split(' ')
    end
  end
end
