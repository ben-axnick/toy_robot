require "spec_helper"

describe ToyRobot::Commands::Simple do
  describe ".construct" do
    context "an instance of the constructed class" do
      subject(:command) { described_class.construct(:simple).new }

      describe "#perform" do
        it "it returns the result of executing against the bot" do
          expected_response = double
          robot = double(simple: expected_response)

          expect(command.perform(robot)).to eq(expected_response)
        end
      end

      describe ".matches?" do
        it "matches when cmd is simple" do
          expect(command.class.matches?("simple")).to eq(true)
        end

        it "doesn't match arbitrary values" do
          expect(command.class.matches?("simpler")).to eq(false)
        end
      end
    end
  end
end
