module ToyRobot
  module Commands
    class Simple
      def initialize(trigger, action)
        @trigger = trigger
        @action = action
      end

      def action(tokens)
        action_klass.new(@action) if @trigger.to_s == tokens.cmd
      end

      private

      def action_klass
        Struct.new(:action) do
          def perform(robot)
            Result.new(action.call(robot))
          end
        end
      end
    end
  end
end
