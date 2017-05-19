require "markov"

#ARRANGE ACT ASSERT

RSpec.describe Markov do
  describe "#parse" do
    it "removes extra whitespace" do
      sentence = "Boo\nHoo"
      desired_output = ["Boo Hoo"]

      output = Markov.parse(sentence)

      expect(output).to eq(desired_output)
    end

    it "splits text into sentences" do
      sentence = "Who took all my cows? Asked Bob. I did!"
      desired_output = ["Who took all my cows?", "Asked Bob.", "I did!"]

      result = Markov.parse(sentence)

      expect(result).to eq(desired_output)
    end
  end

  describe "#read_file" do
    it "reads a text file" do
      file_name = "leviticus.txt"

      text = Markov.read_file(file_name)

      expect(text).to include("burnt-offering of the herd")
    end
  end
end