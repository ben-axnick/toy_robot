require "spec_helper"

describe ToyRobot::CommandInterpreter do
  let(:commands) { [] }
  let(:fallback) { ToyRobot::Commands::Null }

  subject(:command_interpreter) {
    described_class.new(
      commands: commands,
      fallback: fallback
    )
  }

  def build_command(matches:)
    class_double(
      ToyRobot::Commands::Null,
      matches?: matches,
      new: nil
    )
  end

  describe "#process" do
    it "asks each command if it matches" do
      my_command = build_command(matches: true)
      commands << my_command

      command_interpreter.process("testing")
      expect(my_command).to have_received(:matches?).with("testing")
    end

    it "instantiates the first command that matches" do
      no_match = build_command(matches: false)
      match = build_command(matches: true)

      commands << no_match
      commands << match

      command_interpreter.process("testing")
      expect(match).to have_received(:new)
    end

    it "passes the tokenizer args to the #new method" do
      my_command = build_command(matches: true)
      commands << my_command

      command_interpreter.process("testing 1,2,3")
      expect(my_command).to have_received(:new).with("1", "2", "3")
    end

    it "returns the fallback command when none match" do
      no_match = build_command(matches: false)

      commands << no_match

      expect(command_interpreter.process("testing")).to be_instance_of(fallback)
    end
  end
end
