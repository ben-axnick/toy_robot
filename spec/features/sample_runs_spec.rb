require "spec_helper"

describe "executing plain text examples" do
  examples = Dir[File.join(File.dirname(__FILE__), "..", "..", "examples", "*")]

  examples.each do |sample|
    it "passes for #{File.basename(sample)}" do
      cli = ToyRobot::CLI.new
      input = File.readlines(sample)

      expectation_match = /Output: (.*)/

      output = input.reduce([]) do |acc, line|
        acc << cli.process_line(line)
      end.compact

      expected = input
        .select { |line| line =~ expectation_match }
        .map { |line| line.match(expectation_match)[1] }

      expect(output).to eq(expected)
    end
  end
end
