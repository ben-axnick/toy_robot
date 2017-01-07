require "spec_helper"

describe ToyRobot::Orientation do
  describe ".coerce" do
    VALID_INPUTS = ["North", "EAST", "south", :west]

    VALID_INPUTS.each do |input|
      it "can coerce #{input}" do
        expect(described_class.coerce(input)).to_not be_nil
      end
    end

    it "does not coerce an invalid direction" do
      expect(described_class.coerce("northwest")).to be_nil
    end
  end

  describe "#rotate" do
    it "can be rotated anti-clockwise" do
      expect(described_class.coerce(:east).rotate(1).label).to eq(:north)
    end

    it "can be rotated clockwise" do
      expect(described_class.coerce(:south).rotate(-1).label).to eq(:west)
    end
  end

  describe "#==" do
    it "doesn't rely on identity" do
      a = described_class.new(:east, ToyRobot::Vector.new(1, 0))
      b = described_class.new(:east, ToyRobot::Vector.new(1, 0))

      expect(a).to eq(b)
    end
  end

  describe "#to_s" do
    it "returns the upcased direction" do
      south = described_class.coerce(:south)
      expect(south.to_s).to eq("SOUTH")
    end
  end
end
