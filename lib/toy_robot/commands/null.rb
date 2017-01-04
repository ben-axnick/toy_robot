module ToyRobot
  module Commands
    class Null
      class Action
        def self.perform(robot)
          Result.new(robot)
        end
      end
      
      def self.action(_)
        Action
      end
    end
  end
end
