module ToyRobot
  module Commands
    module Named
      def self.command_name
        name.split("::").last.downcase
      end

      def self.matches?(cmd)
        command_name == cmd
      end
    end
  end
end
