class ToyRobot::CLI < Struct.new(:robot, :commands)
  def process_line(line)
    return if line.nil?

    tokens = TokenizedLine.new(line)
    command = commands.construct(tokens.cmd, tokens.args)

    if command
      @robot = command.perform(robot)
      puts command.output if command.output
    end
  end
end
