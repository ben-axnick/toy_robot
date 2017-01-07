require "spec_helper"

describe ToyRobot::UnplacedRobot do
  describe "#place" do
    it "returns an object that can report its location" do
      unplaced_robot = described_class.new
      placed_robot = unplaced_robot.place(
        instance_double(ToyRobot::TablePlacement, within_bounds?: true)
      )

      expect(placed_robot.respond_to?(:table_placement)).to eq(true)
    end
  end
end
