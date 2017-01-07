require "spec_helper"

describe ToyRobot::TablePlacement do
  def construct(x, y, dir)
    vector = ToyRobot::Vector.coerce(x, y)
    orientation = ToyRobot::Orientation.coerce(dir)

    described_class.new(vector, orientation)
  end

  describe "#within_bounds" do
    it "recognises an in-bounds placement" do
      placement = construct(2, 3, :north)
      expect(placement).to be_within_bounds
    end

    it "recognises a horizontally out-of-bounds placement" do
      placement = construct(6, 0, :north)
      expect(placement).to_not be_within_bounds
    end

    it "recognises a vertically out-of-bounds placement" do
      placement = construct(0, -1, :north)
      expect(placement).to_not be_within_bounds
    end
  end

  describe "#move" do
    expectations = {
      north: [0, -1],
      east: [1, 0],
      south: [0, 1],
      west: [-1, 0]
    }

    expectations.each do |facing, result|
      it "is offset to #{result} when facing #{facing}" do
        placement = construct(0, 0, facing)
        new_placement = placement.move

        expect([new_placement.position.x, new_placement.position.y]).to eq(result)
      end
    end
  end

  describe "#left" do
    it "can correctly turn from the north" do
      placement = construct(0, 0, :north)
      new_placement = placement.left

      expect(new_placement.orientation.label).to eq(:west)
    end
  end
  
  describe "#right" do
    it "can correctly turn from the west" do
      placement = construct(0, 0, :west)
      new_placement = placement.right

      expect(new_placement.orientation.label).to eq(:north)
    end
  end
end
