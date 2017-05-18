require "markov"

#ARRANGE ACT ASSERT

RSpec.describe Markov do
  describe "#parse" do
    it "reads a text file" do
      file_name = "leviticus.txt"

      text = Markov.parse(file_name)

      expect(text).to include("burnt-offering of the herd")
    end

    it "removes extra whitespace" do
      file_name = "leviticus.txt"

      text = Markov.parse(file_name)

      expect(text).to_not include("\n")
    end

    it "replaces sentence-terminating punctuation with markers" do
      sentence = "Who took all my cows? Asked Bob. I did!"
      desired_output = "Who took all my cows?@END Asked Bob.@END I did!@END"

      result = Markov.parse(sentence)

      expect(result).to eq(desired_output)
    end
  end

  describe "#read_file" do
    fit "reads a text file" do
      file_name = "leviticus.txt"

      text = Markov.read_file(file_name)

      expect(text).to include("burnt-offering of the herd")
    end
  end
end