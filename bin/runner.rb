#!/usr/bin/env ruby

require 'toy_robot'

cli = ToyRobot::CLI.new

interactive_mode = ARGF.filename == "-" && STDIN.tty?

if interactive_mode
  puts "Starting in interactive mode."

  while (input = gets.chomp)
    output = cli.process_line(input)
    puts output if output
  end
else
  ARGF.read.split(?\n).each { |line|
    output = cli.process_line(line)
    puts output if output
  }
end
