require "spec_helper"

describe ToyRobot::TablePlacement do
  describe "#within_bounds" do
    it "recognises an in-bounds placement" do
      placement = described_class.new(2, 3, :north)
      expect(placement).to be_within_bounds
    end

    it "recognises a horizontally out-of-bounds placement" do
      placement = described_class.new(6, 0, :north)
      expect(placement).to_not be_within_bounds
    end

    it "recognises a vertically out-of-bounds placement" do
      placement = described_class.new(0, -1, :north)
      expect(placement).to_not be_within_bounds
    end
  end

  describe "#valid_orientation?" do
    %i(north east south west).each do |orientation|
      it "recognises #{orientation} as valid" do
        placement = described_class.new(0, 0, orientation)
        expect(placement.valid_orientation?).to eq(true)
      end
    end

    it "does not recognise a made up direction" do
      placement = described_class.new(0, 0, "up")
      expect(placement.valid_orientation?).to eq(false)
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
        placement = described_class.new(0, 0, facing)
        new_placement = placement.move

        expect([new_placement.x, new_placement.y]).to eq(result)
      end
    end
  end

  describe "#left" do
    it "can correctly turn from the north" do
      placement = described_class.new(0, 0, :north)
      new_placement = placement.left

      expect(new_placement.orientation).to eq(:west)
    end
  end
  
  describe "#right" do
    it "can correctly turn from the west" do
      placement = described_class.new(0, 0, :west)
      new_placement = placement.right

      expect(new_placement.orientation).to eq(:north)
    end
  end
end
