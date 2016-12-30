require 'spec_helper'

describe ToyRobot::CLI do
  subject(:cli) { described_class.new(command_interpreter: command_interpreter) }
  let(:command_interpreter) {
    instance_double(ToyRobot::CommandInterpreter, process: dummy_command)
  }
  let(:dummy_command) { ToyRobot::Commands::Null.new }

  it "causes the interpreter to process the line" do
    cli.process_line("HELLO")
    expect(command_interpreter).to have_received(:process).with("HELLO")
  end

  it "returns the output of the command" do
    allow(dummy_command).to receive(:output) { "YO" }

    expect(cli.process_line("ANYONE THERE?")).to eq("YO")
  end
end
