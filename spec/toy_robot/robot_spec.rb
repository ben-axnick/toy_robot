require "spec_helper"

describe ToyRobot::Robot do
  subject(:robot) { described_class.new(placement) }
  let(:placement) { ToyRobot::TablePlacement.place(0, 0, :south) }

  describe "#place" do
    it "returns a robot placed at the new location" do
      attempted_placement = ToyRobot::TablePlacement.place(2, 2, :north)
      new_robot = robot.place(attempted_placement)

      expect(new_robot.table_placement).to eq(attempted_placement)
    end

    it "ignores an out-of-bounds placement" do
      original_placement = robot.table_placement
      attempted_placement = ToyRobot::TablePlacement.place(-1, -1, :south)
      new_robot = robot.place(attempted_placement)

      expect(new_robot.table_placement).to eq(original_placement)
    end
  end

  describe "#left" do
    it "returns a robot rotated to the left" do
      new_robot = robot.left
      expect(new_robot.table_placement.orientation.label).to eq(:east)
    end
  end

  describe "#right" do
    it "returns a robot rotated to the right" do
      new_robot = robot.right
      expect(new_robot.table_placement.orientation.label).to eq(:west)
    end
  end

  describe "#move" do
    it "returns a robot moved in the current direction" do
      new_robot = robot.move

      expect(new_robot.table_placement).to eq(
        ToyRobot::TablePlacement.place(0, 1, :south)
      )
    end

    it "ignores out-of-bounds movement" do
      teetering_robot = ToyRobot::Robot.new(
        ToyRobot::TablePlacement.place(0, 0, :north)
      )

      new_robot = teetering_robot.move

      expect(new_robot.table_placement).to eq(teetering_robot.table_placement)
    end
  end

  describe "#report" do
    it "returns string formatted as x, y, orientation" do
      expect(robot.report).to eq("0, 0, SOUTH")
    end 
  end
end
