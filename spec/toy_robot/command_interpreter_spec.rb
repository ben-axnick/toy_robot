require "spec_helper"

describe ToyRobot::CommandInterpreter do
  let(:commands) { [] }
  let(:tokenizer) { ToyRobot::Tokenizer.new }

  subject(:command_interpreter) {
    described_class.new(
      commands: commands,
      tokenizer: tokenizer,
    )
  }

  def build_command(action = nil)
    instance_double(
      ToyRobot::Commands::Simple,
      action: action
    )
  end

  describe "#process" do
    it "passes the tokenized args to the #action method" do
      allow(tokenizer).to \
        receive(:tokenize).with("testing 1,2,3").and_return("foo")

      my_command = build_command
      commands << my_command

      command_interpreter.process("testing 1,2,3")
      expect(my_command).to have_received(:action).with("foo")
    end

    it "returns the first action that resolves to non nil" do
      match_action = double

      no_match = build_command
      match = build_command(match_action)

      commands << no_match
      commands << match

      result = command_interpreter.process("testing")
      expect(result).to eq(match_action)
    end

    it "returns the fallback action when none match" do
      no_match = build_command
      commands << no_match

      expect(command_interpreter.process("testing")).to \
        eq(ToyRobot::Commands::Null::Action)
    end
  end
end
