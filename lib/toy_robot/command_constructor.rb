class ToyRobot::CommandConstructor
  COMMANDS = [
    Commands::Place,
    Commands::Null
  ]

  def construct(cmd, args = [])
    commands.first { |command| command.name == cmd }.new(*tokens.args)
  end
end
