require "spec_helper"

describe ToyRobot::Commands::Wrapped do
  subject(:command) { described_class.new(:simple, Proc.new {}) }

  context "the returned action" do
    subject(:action) {
      tokens = ToyRobot::Tokenizer.new.tokenize("simple")
      described_class.new(:simple, passed_proc).action(tokens)
    }
    let(:passed_proc) { instance_double(Proc) }

    it "it returns a Result with the original bot and output" do
      robot = double
      allow(passed_proc).to receive(:call).with(robot).and_return(:foo)

      aggregate_failures do
        result = action.perform(robot)
        expect(result.robot).to eq(robot)
        expect(result.output).to eq(:foo)
      end
    end
  end
end
