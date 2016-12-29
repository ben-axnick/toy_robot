class Commands::Place
  include Named

  def perform(robot)
    robot.place(@x, @y, @dir)
  end
end
