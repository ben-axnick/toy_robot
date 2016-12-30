require "spec_helper"

describe ToyRobot::UnplacedRobot do
  describe "#place" do
    it "returns an object that can report its location" do
      unplaced_robot = described_class.new
      location = instance_double(ToyRobot::TablePlacement)

      expect(unplaced_robot.place(location)).to be_kind_of(ToyRobot::Robot)
    end
  end
end
