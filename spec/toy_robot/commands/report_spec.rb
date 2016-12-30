require "spec_helper"

describe ToyRobot::Commands::Report do
  describe "#perform" do
    it "gives me back my robot" do
      robot = instance_double(ToyRobot::Robot, report: nil)
      expect(described_class.new.perform(robot)).to eq(robot)
    end

    it "mutates with the contents of robot#report" do
      robot = instance_double(ToyRobot::Robot, report: "robot rock")
      report = described_class.new
      report.perform(robot)

      expect(report.output).to eq("robot rock")
    end
  end

  describe ".matches?" do
    it "matches when cmd is report" do
      expect(described_class.matches?("report")).to eq(true)
    end

    it "doesn't match arbitrary values" do
      expect(described_class.matches?("rreport")).to eq(false)
    end
  end
end
