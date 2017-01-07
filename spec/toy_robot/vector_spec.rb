require "spec_helper"

describe ToyRobot::Vector do
  describe "#+" do
    it "adds with another vector" do
      mine = described_class.new(1,0)
      other = described_class.new(0, 1)

      result = mine + other

      expect(result.x).to eq(1)
      expect(result.y).to eq(1)
    end
  end

  describe ".coerce" do
    INVALID_INPUTS = [
      ["0-", 0],
      ["hello", 0],
      [nil, 0]
    ]

    it "can coerce a string input" do
      result = described_class.coerce("50", "-100")

      expect(result.x).to eq(50)
      expect(result.y).to eq(-100)
    end

    INVALID_INPUTS.each do |input|
      it "will not coerce #{input.to_s}" do
        expect(described_class.coerce(*input)).to be_nil
      end
    end
  end
end
