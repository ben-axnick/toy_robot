require "spec_helper"

describe ToyRobot::Commands::Place do
  let(:robot) { ToyRobot::UnplacedRobot.new }

  context "the returned action" do
    describe "#perform" do
      it "returns a robot in the new placement" do
        cmd = described_class::Action.new(0, 0, :south)
        new_robot = cmd.perform(robot).robot

        expect(new_robot.table_placement).to eq(
          ToyRobot::TablePlacement.new(0, 0, :south)
        )
      end

      it "ignores an off-the-table placement" do
        cmd = described_class::Action.new(6, 6, :south)
        new_robot = cmd.perform(robot).robot

        expect(new_robot).to_not respond_to(:table_placement)
      end
    end
  end

  describe "#action" do
    def execute_with_args(*args)
      described_class.new.action(
        instance_double(
          ToyRobot::Tokenizer::TokenizedLine,
          cmd: "place",
          args: args
        )
      )
    end

    it "returns a performable action" do
      action = execute_with_args("0", "0", "south")
      expect(action).to respond_to(:perform)
    end

    it "is nil when the cmd does not match" do
      result = described_class.new.action(
        instance_double(ToyRobot::Tokenizer::TokenizedLine, cmd: "nope")
      )

      expect(result).to be_nil
    end

    it "is invalid when x is not a number" do
      action = execute_with_args("hello", "0", "south")
      expect(action).to be_nil
    end

    it "is invalid when y is not a number" do
      action = execute_with_args("0", "0-", "south")
      expect(action).to be_nil
    end

    it "is invalid when orientation is nil" do
      action = execute_with_args("0", "0", nil)
      expect(action).to be_nil
    end
  end
end
