require "markov"

#ARRANGE ACT ASSERT

RSpec.describe Markov do
  describe "#parse" do

    it "works" do
      allow(File).to receive(:read).with("filename.txt").and_return("Who took all my cows? Asked Bob. I did!")

      desired_output = [["Who", "took", "all", "my", "cows?"], ["Asked", "Bob."], ["I", "did!"]]

      result = Markov.parse("filename.txt")

      expect(result).to eq(desired_output)
    end
  end

  describe "#read_file" do
    it "reads a text file" do

      allow(File).to receive(:read).with("filename.txt").and_return("Who took all my cows? Asked Bob. I did!")

      text = Markov.read_file("filename.txt")

      expect(text).to eq("Who took all my cows? Asked Bob. I did!")
    end
  end

  describe "#replace_newlines" do
    it "replaces newlines with single spaces" do
      input = "Boo\nhoo"
      desired_output = "Boo hoo"

      result = Markov.replace_newlines(input)

      expect(result).to eq(desired_output)
    end
  end

  describe "#insert_end_markers" do
    it "inserts @END after sentence-terminating punctuation" do
      input = "Who took all my cows? Asked Bob. I did!"
      desired_output = "Who took all my cows?@ENDAsked Bob.@ENDI did!@END"

      result = Markov.insert_end_markers(input)

      expect(result).to eq(desired_output)
    end
  end

  describe "#separate_lines" do
    it "splits the text on @END markers" do
      input = "Who took all my cows?@ENDAsked Bob.@ENDI did!@END"
      desired_output = ["Who took all my cows?", "Asked Bob.", "I did!"]

      result = Markov.separate_lines(input)

      expect(result).to eq(desired_output)
    end
  end

  describe "#tokenize" do
    it "splits a line into words" do
      input = "Who took all my cows?"
      desired_output = ["Who", "took", "all", "my", "cows?"]

      result = Markov.tokenize(input)

      expect(result).to eq(desired_output)
    end
  end
end