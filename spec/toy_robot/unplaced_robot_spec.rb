require "spec_helper"

describe ToyRobot::UnplacedRobot do
  describe "#place" do
    it "returns an object that can report its location" do
      robot = described_class.new.place(
        instance_double(ToyRobot::TablePlacement, within_bounds?: true)
      )

      expect(robot.respond_to?(:table_placement)).to eq(true)
    end

    it "does not place to an out of bounds location" do
      robot = described_class.new.place(
        instance_double(ToyRobot::TablePlacement, within_bounds?: false)
      )

      expect(robot.respond_to?(:table_placement)).to eq(false)
    end
  end

  describe "#left" do
    it "returns itself (no-op)" do
      robot = described_class.new
      expect(robot.left).to eq(robot)
    end
  end

  describe "#right" do
    it "returns itself (no-op)" do
      robot = described_class.new
      expect(robot.right).to eq(robot)
    end
  end

  describe "#move" do
    it "returns itself (no-op)" do
      robot = described_class.new
      expect(robot.move).to eq(robot)
    end
  end
end
