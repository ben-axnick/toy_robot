require "spec_helper"

describe ToyRobot::Commands::Move do
  subject(:command) { described_class.new }

  describe "#perform" do
    it "returns the moved version of my robot" do
      expected_response = double
      robot = instance_double(ToyRobot::Robot, move: expected_response)

      expect(command.perform(robot)).to eq(expected_response)
    end
  end

  describe ".matches?" do
    it "matches when cmd is move" do
      expect(described_class.matches?("move")).to eq(true)
    end

    it "doesn't match arbitrary values" do
      expect(described_class.matches?("mauve")).to eq(false)
    end
  end
end
