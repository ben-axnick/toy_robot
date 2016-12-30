require "spec_helper"

describe ToyRobot::Commands::Right do
  subject(:command) { described_class.new }
  
  describe "#perform" do
    it "returns the right version of my robot" do
      expected_response = double
      robot = instance_double(ToyRobot::Robot, right: expected_response)

      expect(command.perform(robot)).to eq(expected_response)
    end
  end

  describe ".matches?" do
    it "matches when cmd is right" do
      expect(described_class.matches?("right")).to eq(true)
    end

    it "doesn't match arbitrary values" do
      expect(described_class.matches?("righty")).to eq(false)
    end
  end
end
