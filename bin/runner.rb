#!/usr/bin/env ruby

require 'toy_robot'

world = ToyRobot::World.new
cli = ToyRobot::CLI.new(world)

interactive_mode = ARGF.filename == "-" && STDIN.tty?

if interactive_mode
  puts "Starting in interactive mode."

  while (input = gets.chomp)
    cli.process_line(input)
  end
else
  ARGF.read.split(?\n).each { |line| cli.process_line(line) }
end
