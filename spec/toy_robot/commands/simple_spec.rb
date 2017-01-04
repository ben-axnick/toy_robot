require "spec_helper"

describe ToyRobot::Commands::Simple do
  subject(:command) { described_class.new(:simple, Proc.new {}) }

  describe "#action" do
    it "returns a performable action when the command matches" do
      tokens = ToyRobot::Tokenizer.new.tokenize("simple")
      expect(command.action(tokens)).to respond_to(:perform)
    end

    it "returns nil when the command does not match" do
      tokens = ToyRobot::Tokenizer.new.tokenize("simpler")
      expect(command.action(tokens)).to be_nil
    end
  end

  context "the returned action" do
    subject(:action) {
      tokens = ToyRobot::Tokenizer.new.tokenize("simple")
      described_class.new(:simple, passed_proc).action(tokens)
    }
    let(:passed_proc) { instance_double(Proc) }

    it "it returns a Result with the result of the passed proc" do
      robot = double
      allow(passed_proc).to receive(:call).with(robot).and_return(:foo)

      expect(action.perform(robot).robot).to eq(:foo)
    end
  end
end
