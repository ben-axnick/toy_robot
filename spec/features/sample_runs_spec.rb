require "spec_helper"

describe "executing plain text examples" do
  examples = Dir[File.join(File.dirname(__FILE__), "..", "..", "examples", "*")]

  examples.each do |sample|
    it "passes for #{File.basename(sample)}" do
      input = File.new(sample)
      output = StringIO.new

      ToyRobot::CLI.start(input, output)

      expectation_match = /Output: (.*)/
      expected = File.readlines(sample)
        .select { |line| line =~ expectation_match }
        .map { |line| line.match(expectation_match)[1] }

      expect(output.string.split("\n")).to eq(expected)
    end
  end
end
