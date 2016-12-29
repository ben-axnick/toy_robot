module ToyRobot
  module Commands
    class Null
      def initialize(*_)
      end

      def self.matches?
        true
      end
    end
  end
end
