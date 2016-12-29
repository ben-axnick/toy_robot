require 'spec_helper'

describe ToyRobot::CLI do
  it "initializes with one parameter" do
    cli = described_class.new(double)
  end
end
