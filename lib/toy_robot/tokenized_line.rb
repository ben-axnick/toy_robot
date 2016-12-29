class ToyRobot::TokenizedLine < Struct.new(:line)
  def cmd
    whitespace_tokens.first
  end

  def args
    whitespace_tokens[1..-1].split(',').map(&:strip)
  end

  def self.tokenize(line)
    new(line)
  end

  private

  def whitespace_tokens
    @line.strip.downcase.split(' ')
  end
end
