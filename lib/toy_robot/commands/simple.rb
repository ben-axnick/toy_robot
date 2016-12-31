module ToyRobot
  module Commands
    class Simple
      def self.construct(robot_method)
        Class.new do
          attr_reader :output

          def initialize(*_)
          end

          define_method(:perform) do |robot|
            robot.public_send(robot_method)
          end

          define_singleton_method(:matches?) do |cmd|
            robot_method.to_s == cmd
          end
        end
      end
    end
  end
end
