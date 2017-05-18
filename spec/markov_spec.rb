require 'markov'


#ARRANGE ACT ASSERT

RSpec.describe Markov do
  describe '#parse' do
    it "reads a text file" do
      file_name = "leviticus.txt"

      text = Markov.parse(file_name)
      
      expect(text).to include('burnt-offering of the herd')
    end
  end

end