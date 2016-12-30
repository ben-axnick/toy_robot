require "spec_helper"

describe ToyRobot::Tokenizer do
  subject(:tokenizer) { described_class.new }

  it "handles a blank line without exceptions" do
    expect(tokenizer.tokenize("").cmd).to be_nil
  end

  it "downcases and strips the command" do
    expect(tokenizer.tokenize("   FOO ").cmd).to eq("foo")
  end

  it "accepts a single argument" do
    expect(tokenizer.tokenize("FOO BAR").args).to eq(["bar"])
  end

  it "accepts and strips a comma separated list of arguments" do
    expect(tokenizer.tokenize("PLACE  1, 2,  South").args).to \
      eq(["1", "2", "south"])
  end
end
