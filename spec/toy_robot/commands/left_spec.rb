require "spec_helper"

describe ToyRobot::Commands::Left do
  subject(:command) { described_class.new }

  describe "#perform" do
    it "returns the left version of my robot" do
      expected_response = double
      robot = instance_double(ToyRobot::Robot, left: expected_response)

      expect(command.perform(robot)).to eq(expected_response)
    end
  end

  describe ".matches?" do
    it "matches when cmd is left" do
      expect(described_class.matches?("left")).to eq(true)
    end

    it "doesn't match arbitrary values" do
      expect(described_class.matches?("lefty")).to eq(false)
    end
  end
end
