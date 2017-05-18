require 'markov'


#ARRANGE ACT ASSERT

RSpec.describe Markov do
  describe '#parse' do
    it "reads a text file" do
      text = Markov.parse('leviticus.txt')
      expect(text).to include('burnt-offering of the herd')
    end
  end

end