require 'toy_robot/session'

module ToyRobot
  class CLI
    def self.start(in_s, out_s)
      out_s.puts "Starting in interactive mode." if in_s.tty?
      session = Session.new

      in_s.each_line.lazy
        .map { |line| session.process_line(line) }
        .reject { |output| output.nil? }
        .each { |output| out_s.puts(output) }
    end
  end
end
