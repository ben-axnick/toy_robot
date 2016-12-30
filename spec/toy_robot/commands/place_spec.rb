require "spec_helper"

describe ToyRobot::Commands::Place do
  let(:robot) { ToyRobot::UnplacedRobot.new }

  describe "#perform" do
    it "returns a robot in the new placement" do
      cmd = described_class.new("0", "0", "south")
      new_robot = cmd.perform(robot)

      expect(new_robot.table_placement).to eq(
        ToyRobot::TablePlacement.new(0, 0, :south)
      )
    end

    it "returns an unchanged robot when invalid" do
      cmd = described_class.new("0", "hello", "south")
      new_robot = cmd.perform(robot)

      expect(new_robot).to_not respond_to(:table_placement)
    end
  end

  describe "valid?" do
    it "is invalid when x is not a number" do
      cmd = described_class.new("hello", "0", "south")
      expect(cmd).to_not be_valid
    end

    it "is invalid when y is not a number" do
      cmd = described_class.new("0", "0-", "south")
      expect(cmd).to_not be_valid
    end

    it "is invalid when orientation is nil" do
      cmd = described_class.new("0", "0", nil)
      expect(cmd).to_not be_valid
    end

    it "is invalid when out of bounds" do
      cmd = described_class.new("6", "6", "south")
      expect(cmd).to_not be_valid
    end

    it "is valid when given in bounds co-ordinates" do
      cmd = described_class.new("0", "0", "south")
      expect(cmd).to be_valid
    end
  end

  describe ".matches?" do
    it "matches when cmd is place" do
      expect(described_class.matches?("place")).to eq(true)
    end

    it "doesn't match arbitrary values" do
      expect(described_class.matches?("placed")).to eq(false)
    end
  end
end
